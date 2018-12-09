//
//  ViewController.swift
//  CaseyTableView
//
//  Created by Casey on 07/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let _tableview = UITableView()
    var _cellArr = Array<NSValue>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _tableview.estimatedRowHeight = 0
        _tableview.delegate = self
        _tableview.dataSource = self
        _tableview.frame = self.view.bounds
        self.view.addSubview(_tableview)
        
    }
    
    //MARK: tableview delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        
        cell!.textLabel?.text = String(indexPath.row)
        
        var exist = false
        for value in _cellArr {
            
            if let storeCell = value.nonretainedObjectValue as? UITableViewCell{
                if (storeCell == cell) {
                    exist = true
                    break
                }
            }
            
        }
        
        if !exist {
            
            _cellArr.append(NSValue.init(nonretainedObject: cell))
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
       // print(_cellArr.count)
        
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    
}

