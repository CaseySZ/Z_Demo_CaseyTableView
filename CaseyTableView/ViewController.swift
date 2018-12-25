//
//  ViewController.swift
//  CaseyTableView
//
//  Created by Casey on 07/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit
/*
 相关疑问请在评论区留言 https://www.jianshu.com/p/80ec217f6f08
 */
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let _tableview = UITableView()
    var _cellArr = ["initTheoryStudy", "Theory", "headerSuspend", "DeleteStyle"];
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false;
        _tableview.estimatedRowHeight = 0
        _tableview.delegate = self
        _tableview.dataSource = self
        _tableview.frame = self.view.bounds
        self.view.addSubview(_tableview)
        
    }
    
    //MARK: tableview delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return _cellArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        cell!.textLabel?.text =  _cellArr[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(TheoryInitViewController(), animated: true)
        }else if indexPath.row == 1 {
            self.navigationController?.pushViewController(TheoryViewController(), animated: true)
        }else if indexPath.row == 2 {
            self.navigationController?.pushViewController(HeaderSuspendViewController(), animated: true)
        }else {
            self.navigationController?.pushViewController(DeleteStyleViewController(), animated: true)
        }
        
        
    }
    
    
}

