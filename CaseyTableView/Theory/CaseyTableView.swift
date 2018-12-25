//
//  CaseyTableView.swift
//  CaseyTableView
//
//  Created by Casey on 07/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

/*
 重用池，现有池
 复用机制（UI复用） （后面总结：UI复用，model不复用（model是位置记录，需要留下点痕迹吧））
 */

import UIKit


/*入口reloadData
 
 1 准备数据
    每一个cell的y， 高度height 保存
 
 
 2 UI处理
    2.1显示当前可视区域的cell
    2.2不在可视区域（屏幕内）的cell，移除到重用池里面
 */


class CaseyTableView: UIScrollView {

    
    weak var cyDelegate:CaseyTableViewDelegate?
    var _rowModelArr = Array<RowInfoModel>()
    
    var _visibleCellPoolInfo = Dictionary<String,UITableViewCell>()
    var _reuseCellPoolArr = Array<UITableViewCell>()
    
    // 刷tableview
    func reloadData()  {
        // 1 数据处理
        self.handleData()
        // 2 UI处理
        self.setNeedsLayout()
        
    }
    
     //  1 数据处理
    func handleData()  {
        
        _rowModelArr.removeAll()
        
        var totalHeight:CGFloat = 0.0
        //  1.1 cell的数量
        if let rowCount =  cyDelegate?.tableView(self, numberOfRowsInSection: 0) {
            
            // 1.2 计算每个cell的位置和高度
            for index in 0...rowCount {
                
                // 1.3 存储位置信息
                var model = RowInfoModel()
                model.y = totalHeight
                let indexPath = IndexPath.init(row: index, section: 0)
                model.height = cyDelegate?.tableView(self, heightForRowAt: indexPath) 
                
                totalHeight += model.height ?? 0.0
                _rowModelArr.append(model)
            }
        }
        
        self.contentSize = CGSize.init(width: self.frame.width, height: totalHeight)
    }
    
     // 2 UI 处理
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 2.1 获取屏幕(可视区域)的起始位置和结束位置
        let startY = self.contentOffset.y < 0 ? 0 : self.contentOffset.y
        let endY = (self.contentOffset.y + self.frame.height > self.contentSize.height) ?  self.contentSize.height : (self.contentOffset.y + self.frame.height)
        
        
         // 2.2 获取当前 cell的开始索引 和 结束索引
        /*
        var startRowIndex = -1
        var endRowIndex = -1
        
        var index = 0
        for model in _rowModelArr {
            
            if model.y! <= startY && (model.y! + model.height!) >= startY {
                startRowIndex = index
            }
            if model.y! <= endY && (model.y! + model.height!) >= endY {
                endRowIndex = index
            }
            
            index = index + 1
        }
        
        */
        
        
        let startRowIndex = binarySeach(arry: _rowModelArr, start: 0, end: _rowModelArr.count-1, targert: startY)
        let endRowIndex = binarySeach(arry: _rowModelArr, start: 0, end: _rowModelArr.count-1, targert: endY)
        
        if startRowIndex == -1 || endRowIndex == -1{
            return 
        }
        
          // 2.3 显示当前可视区域的Cell
        for index in startRowIndex...endRowIndex {
            
            if let _ = _visibleCellPoolInfo[String(index)] {
                
            }else{
                
                let indexPath = IndexPath.init(row: index, section: 0)
                if let cell = cyDelegate?.tableView(self, cellForRowAt: indexPath){
                    
                    let model = _rowModelArr[index]
                    cell.frame = CGRect.init(x: 0, y: model.y!, width: self.frame.width, height: model.height!)
                    if cell.superview == nil {
                        self.addSubview(cell)
                    }
                    
                    _visibleCellPoolInfo[String(index)] = cell
                }
                
            }
        }
        
        // 2.4 清理UI （不在可视区域的cell，移除到重用池中去）
        
        // 把_visiblePooDict 不在可视区域的cell，移除到重用池中
        for indexKey in _visibleCellPoolInfo.keys {
            
            if Int(indexKey)! < startRowIndex ||  Int(indexKey)! > endRowIndex {
                
                if let cell =  _visibleCellPoolInfo.removeValue(forKey: indexKey){
                    _reuseCellPoolArr.append(cell)
                }
            }
        }
    }
    
    
    // 3 重用机制
    func dequeueReusableCell(withIdentifier: String) -> UITableViewCell? {
       
        if _reuseCellPoolArr.count > 0{
            let cell = _reuseCellPoolArr.first
            _reuseCellPoolArr.remove(at: 0)
            return cell
        }else{
            return nil
        }
        
    }
    
    func binarySeach(arry:Array<RowInfoModel>, start:Int , end:Int, targert:CGFloat) -> Int {
    
        if start < 0 || end < 0 {
            return -1
        }
        
        if start == end  {
            
            let model = arry[start]
            if model.y! <= targert && targert < model.y! + model.height! {
                return start
            }else{
                return -1
            }
        }else if (end - start == 1){
            
            
            for index in start...end {
                let model = arry[index]
                if model.y! <= targert && targert < model.y! + model.height! {
                    return index
                }
            }
            
            return -1
            
        }else  {
            
            let middle = start + (end - start)/2
            
            let model = arry[middle]
            if model.y! <= targert && targert < model.y! + model.height! {
                return middle
            }else if (targert > model.y! + model.height!){
                 // 在右边
                return binarySeach(arry: arry, start: middle+1, end: end, targert: targert)
                
            }else {
                // 在左边
                return binarySeach(arry: arry, start: start, end: middle-1, targert: targert)
                
            }
        }
    
    }

}
