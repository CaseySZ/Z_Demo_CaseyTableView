//
//  SecondViewController.swift
//  CaseyTableView
//
//  Created by Casey on 07/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, CaseyTableViewDelegate {

    let _tableview = CaseyTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        _tableview.cyDelegate = self
        _tableview.frame = self.view.bounds
        
        self.view.addSubview(_tableview)
        
        _tableview.reloadData()
    }
    
    
    func tableView(_ tableView: CaseyTableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: CaseyTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: CaseyTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = String(indexPath.row)
        return cell!
        
    }

    
    

}
