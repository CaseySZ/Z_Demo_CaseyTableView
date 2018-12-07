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
 
 1 数据准备
    1.1 准备cell的model
 
 
 2 UI处理
    2.1 计算出当前屏幕可视区域要显示的cell
    2.2 不在可视区域的cell移除到复用池
 */


class CaseyTableView: UIScrollView {

    
    weak var cyDelegate:CaseyTableViewDelegate?
    var _rowModelArr = Array<RowInfoModel>()
    
    var _visibleCellPoolInfo = Dictionary<String,UITableViewCell>()
    var _reuseCellPoolArr = Array<UITableViewCell>()
    
    
    func reloadData()  {
        
        self.dataPrepare()
        self.setNeedsLayout()
        
    }
    
    func dataPrepare()  {
        
        _rowModelArr.removeAll()
        // 获取所有的indexPath
        var totalHeight:CGFloat = 0.0
        if let rowCount =  cyDelegate?.tableView(self, numberOfRowsInSection: 0) {
            
            for index in 0...rowCount {
                
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
    
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let startY = self.contentOffset.y < 0 ? 0 : self.contentOffset.y
        let endY = self.contentOffset.y + self.frame.height > self.contentSize.height ?  self.contentSize.height - self.frame.height : self.contentOffset.y + self.frame.height
        
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
        
        // 数据清理
        for indexKey in _visibleCellPoolInfo.keys {
            
            if Int(indexKey)! < startRowIndex ||  Int(indexKey)! > endRowIndex {
                
                if let cell =  _visibleCellPoolInfo.removeValue(forKey: indexKey){
                    _reuseCellPoolArr.append(cell)
                }
            }
            
        }
    }
    
    

}
