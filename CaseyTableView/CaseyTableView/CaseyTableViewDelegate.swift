//
//  CaseyTableViewDelegate.swift
//  CaseyTableView
//
//  Created by Casey on 07/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit


@objc protocol CaseyTableViewDelegate {

    func tableView(_ tableView: CaseyTableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: CaseyTableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: CaseyTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    
}
