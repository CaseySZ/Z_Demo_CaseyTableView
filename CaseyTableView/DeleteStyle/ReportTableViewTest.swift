//
//  ReportTableView.swift
//  PersonReport
//
//  Created by Casey on 08/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class ReportTableViewTest: UITableView {

    
    var currentCellDeteteStyle:Bool = true
  
    var deleteStatusView: DeleteStatusView = {
        
        let statatusView = DeleteStatusView()
        
        statatusView.backgroundColor = UIColor.blue
        return statatusView
        
    }()
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        print("layoutSubviews")
        changSysTableViewDeleteStyle(myStyle: currentCellDeteteStyle)
        
    }
    
    
    
    func changSysTableViewDeleteStyle(myStyle:Bool)  {
        
        
        
        if let targertView = self.searchSubViewOfClassName("UISwipeActionPullView") {
            
           // targertView.isHidden = true
           // targertView.backgroundColor = UIColor.yellow
//            if let deleteButton = targertView.searchSubViewOfClassName("UISwipeActionStandardButton") as! UIButton? {
//
//              //  deleteButton.backgroundColor = UIColor.init(rgb: 0x2A2E32)
//                deleteButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//                if myStyle == 0 {
//                    deleteButton.setTitleColor(UIColor.init(rgb: 0x888888), for: .normal)
//                }else{
//                    deleteButton.setTitleColor(UIColor.white, for: .normal)
//                }
//
//            }
            
            
            if  deleteStatusView.superview == nil {
                
                
                self.addSubview(deleteStatusView)
            }
            
          //  self.bringSubviewToFront(deleteStatusView)
          //  deleteStatusView.frame = targertView.frame
        }
    }
}



extension UIView {
    
    static var __onceTest:Int = 0
    static func testChangeMethod()  {
        
        DispatchQueue.once(token: &__onceTest) {
        
            if let methodInit =  class_getInstanceMethod(NSClassFromString("UISwipeActionPullView"), NSSelectorFromString("layoutSubviews")) {
                
                if  let methodTarget = class_getInstanceMethod(NSClassFromString("UIView"), #selector(UIView.pullViewLayoutSubviews)){
                
                    print("method_exchangeImplementations")
                    method_exchangeImplementations(methodInit, methodTarget)
                    
                }
            
            }
            
            
            if let methodInit =  class_getInstanceMethod(NSClassFromString("UISwipeActionPullView"), NSSelectorFromString("moveToOffset:extraOffset:animated:usingSpringWithStiffness:initialVelocity:")) {
                
                if  let methodTarget = class_getInstanceMethod(NSClassFromString("UIView"), #selector(UIView.moveToOffsetTest(extraOffset:animated:usingSpringWithStiffness:initialVelocity:))){
                    
                    print("method_exchangeImplementations T")
                    method_exchangeImplementations(methodInit, methodTarget)
                    
                }
                
            }
            // MRAK: Button

            if let methodInit =  class_getInstanceMethod(NSClassFromString("UISwipeActionStandardButton"), NSSelectorFromString("layoutSubviews")) {

                if  let methodTarget = class_getInstanceMethod(NSClassFromString("UIView"), #selector(UIView.standardButtonLayoutSubviews)){

                    print("method_exchangeImplementations")
                    method_exchangeImplementations(methodInit, methodTarget)

                }

            }
            
            
            var outCount:UInt32 = 0
            print("================")
            let methods = class_copyMethodList(NSClassFromString("UISwipeActionStandardButton"), &outCount)
            for i in 0...(outCount-1) {
                
                let aMet: objc_property_t = methods![Int(i)]
                let methodName:String! = String(cString: property_getName(aMet));
                print(methodName)
                
            }
            print("================")
            
            let methodTs = class_copyMethodList(NSClassFromString("UISwipeActionPullView"), &outCount)
            for i in 0...(outCount-1) {
                
                let aMet: objc_property_t = methodTs![Int(i)]
                let methodName:String! = String(cString: property_getName(aMet));
                print(methodName)
                
            }
        }
        
    }
    
    
    @objc func pullViewLayoutSubviews()  {
        
        self.pullViewLayoutSubviews()
        
        if let deleteButton = self.searchSubViewOfClassName("UISwipeActionStandardButton") as! UIButton? {
            
            deleteButton.x = 12;
            deleteButton.y = (self.heigth - 80)/2;
            deleteButton.width = 60;
            deleteButton.heigth = 80;
            deleteButton.layer.cornerRadius = 5
            
            for view in deleteButton.subviews {
                
               // view.backgroundColor = UIColor.yellow
            }
        }
        
      //  self.backgroundColor = UIColor.init(rgb: 0x08090B)
       
    }
    
    @objc func standardButtonLayoutSubviews()  {
        
        self.standardButtonLayoutSubviews()
       // self.backgroundColor = UIColor.clear
//        for view in subviews {
//
//            view.backgroundColor = UIColor.yellow
//        }
        
        let button = self as? UIButton
        
        button?.titleLabel?.backgroundColor = UIColor.init(rgb: 0xFB2464)
        button?.x = 0
        button?.y = (self.heigth - 80)/2
        button?.width = 60
        button?.heigth = 80;
        
        
    }
    
    
    @objc func moveToOffsetTest(extraOffset:CGPoint ,animated:Bool ,usingSpringWithStiffness:Bool ,initialVelocity:Float){
        
        print("moveToOffsetTest")
        
        self.isHidden = true
        self.moveToOffsetTest(extraOffset: extraOffset, animated: animated, usingSpringWithStiffness: usingSpringWithStiffness, initialVelocity: initialVelocity)
        
        
        //let className = NSStringFromClass(type(of: ReportTableView())) as String
        
        let className = NSStringFromClass(ReportTableView.classForCoder()) as String
        let tableview = self.searchSuperViewOfClassName(className) as? ReportTableView
        if tableview != nil {
            
            tableview?.deleteStatusView.frame = self.frame
        }
        
        self.backgroundColor = UIColor.init(rgb: 0xFB2464)
        if let deleteButton = self.searchSubViewOfClassName("UISwipeActionStandardButton") as! UIButton? {
            
            deleteButton.x = 12;
            deleteButton.y = 0;
            deleteButton.width = 60;
            deleteButton.heigth = 80;
            deleteButton.layer.cornerRadius = 5
            deleteButton.backgroundColor = UIColor.init(rgb: 0xFB2464)
            
            for view in deleteButton.subviews {
                
                view.backgroundColor = UIColor.init(rgb: 0xFB2464)
            }
        }
    }
}



