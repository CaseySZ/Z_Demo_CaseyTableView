//
//  DeleteStyleViewController.swift
//  CaseyTableView
//
//  Created by Casey on 14/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class DeleteStyleViewController: UIViewController , UIScrollViewDelegate,UITableViewDelegate, UITableViewDataSource  {
    
    let _tableView = ReportTableView()
    let _navRightButton:UIButton = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TableView 删除Style"
        self.view.backgroundColor = UIColor.init(rgb: 0x28323B)
        
        initUIProperty()
     
    }
    
    private func initUIProperty()  {
        
        _navRightButton.frame = CGRect.init(x: 0, y: 0, width: 60, height: 44)
        _navRightButton.setTitleColor(.white, for: .normal)
        _navRightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        _navRightButton.setTitle("编辑", for: .normal)
        _navRightButton.addTarget(self, action: #selector(self.eidtStatusEvent(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: _navRightButton)
        
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.separatorStyle = .none
        _tableView.estimatedRowHeight = 0;
        _tableView.backgroundColor = UIColor.white
        _tableView.frame = self.view.bounds
        self.view.addSubview(_tableView)
        
    }
    
    
    
    
    //MARK: 编辑状态button事件
    @objc private func eidtStatusEvent(_ sender:UIButton?) {
        
        sender!.isSelected = !(sender!.isSelected)
        
        if sender!.isSelected == true {
            _navRightButton.setTitle("取消", for: .normal)
        }else{
            _navRightButton.setTitle("编辑", for: .normal)
        }
    }
    
    
    
    
    //MARK: TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "ReportInfoCell")
        if cell == nil {
            
            cell = DepositReportInfoCell.init(style: .default, reuseIdentifier: "ReportInfoCell")
            cell?.selectionStyle = .none
            
        }
        cell?.textLabel?.text = String(indexPath.row)
        return cell!
    }
    
    // delete status
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        
        if indexPath.row%2 == 0{
            _tableView.currentCellDeteteStyle = false
            return "不可\n删除"
        }else{
            _tableView.currentCellDeteteStyle = true
            return "删除"
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        
        return .delete
        
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
        }
    }
    
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//
//
//        return .delete
//
//    }
//
//
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//
//        }
//    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
    }
    
    
    
}
