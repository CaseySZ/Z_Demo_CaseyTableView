//
//  ReportTableView.swift
//  PersonReport
//
//  Created by Casey on 08/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

extension UIView {
    
    @objc func moveToOffset(extraOffset:CGPoint ,animated:Bool ,usingSpringWithStiffness:Bool ,initialVelocity:Float){
        
        
        self.isHidden = true
        self.moveToOffset(extraOffset: extraOffset, animated: animated, usingSpringWithStiffness: usingSpringWithStiffness, initialVelocity: initialVelocity)
        
       
        let tableview = self.searchSuperViewOfClassName(NSStringFromClass(ReportTableView.classForCoder())) as? ReportTableView
        if tableview != nil {
            
            tableview?.deleteStatusView.frame = self.frame
        }
            
        
        
    }
    
}

class ReportTableView: UITableView {

    
    var currentCellDeteteStyle:Bool = true
    var deleteStatusView = DeleteStatusView()
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        
        super.init(frame: frame, style: style)
        ReportTableView.changeSysMethodForCellDeleteAction()
        deleteStatusView.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if let _ = self.searchSubViewOfClassName("UISwipeActionPullView") {
            
            if  deleteStatusView.superview == nil {
                
                self.addSubview(deleteStatusView)
            }
            deleteStatusView.deleteStatus = currentCellDeteteStyle
        }
        
    }
    

    static var __once:Int = 0
    static private func changeSysMethodForCellDeleteAction()  {
        
        DispatchQueue.once(token: &__once) {
            
            
            if let methodInit =  class_getInstanceMethod(NSClassFromString("UISwipeActionPullView"), NSSelectorFromString("moveToOffset:extraOffset:animated:usingSpringWithStiffness:initialVelocity:")) {
            
                if  let methodTarget = class_getInstanceMethod(NSClassFromString("UIView"), #selector(ReportTableView.moveToOffset(extraOffset:animated:usingSpringWithStiffness:initialVelocity:))){
                    
                    method_exchangeImplementations(methodInit, methodTarget)
                    
                }
                
            }
            
        }
        
    }
}

