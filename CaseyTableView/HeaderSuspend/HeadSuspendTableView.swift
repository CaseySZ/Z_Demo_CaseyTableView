//
//  HeadSuspendTableView.swift
//  CaseyTableView
//
//  Created by sy on 2018/12/23.
//  Copyright © 2018年 Casey. All rights reserved.
//

import UIKit

class HeadSuspendTableView: UITableView {

    var oneHeadView:UIView?
    var twoHeadView:UIView?
    
    
    
    override func layoutSubviews() {
    
        super.layoutSubviews()
        
        guard (self.oneHeadView != nil) else {
            return
        }
        if self.contentOffset.y > 800 {
            
            self.oneHeadView?.frame = CGRect.init(x: 0, y: self.contentOffset.y, width: self.oneHeadView!.frame.width, height: self.oneHeadView!.frame.height)

            self.oneHeadView!.isHidden = false;
            
            if self.oneHeadView!.superview == nil {
                
                self.addSubview(self.oneHeadView!)
            }
            
            self.twoHeadView!.frame = CGRect.init(x: 0, y: self.oneHeadView!.frame.maxY, width:self.twoHeadView!.frame.width, height: self.twoHeadView!.frame.height)
            
        }
        
    }
    
}
