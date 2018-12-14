//
//  DeleteStatusView.swift
//  PersonReport
//
//  Created by Casey on 09/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class DeleteStatusView: UIView {

    var _deleteStatus = true
    var deleteStatus: Bool  {
        
        get{
            return _deleteStatus
        }set{
            
            _deleteStatus = newValue
            if _deleteStatus {
                
                _button.setTitle("删除", for: .normal)
                _button.setTitleColor(.white, for: .normal)
                _button.backgroundColor = UIColor.init(rgb: 0xFB2464)

                
            }else{
                
                _button.setTitle("不可\n删除", for: .normal)
                _button.setTitleColor(UIColor.init(rgb: 0x888888), for: .normal)
                _button.backgroundColor = UIColor.init(rgb: 0x2A2E32)
            }
        }
        
    }
    
    let _button:UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.numberOfLines = 0
        return button
        
    }()
    
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if _button.superview == nil {
            
            self.addSubview(_button)
        }
        _button.x = 0
        _button.y = (self.heigth - 80)/2
        _button.width = 60
        _button.heigth = 80
    }

}
