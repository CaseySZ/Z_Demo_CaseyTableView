//
//  HeaderSuspendViewController.swift
//  CaseyTableView
//
//  Created by Casey on 14/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class HeaderSuspendViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let _tableview = HeadSuspendTableView()
    var _cellArr = Array<NSValue>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "HeaderSuspend"
        _tableview.estimatedRowHeight = 0
        _tableview.delegate = self
        _tableview.dataSource = self
        _tableview.frame = self.view.bounds
        self.view.addSubview(_tableview)
        
        _tableview.oneHeadView = UIView.init()
        _tableview.oneHeadView?.backgroundColor = .red
        
        _tableview.twoHeadView = UIView.init()
        _tableview.twoHeadView?.backgroundColor = .blue
    }
    
    //MARK: tableview delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return _tableview.oneHeadView!
        }else{
            return _tableview.twoHeadView!
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        cell!.textLabel?.text = String(indexPath.row)
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    

}
