//
//  DispatchOnce.swift
//  PersonReport
//
//  Created by Casey on 09/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    
    public class func once(token:inout Int, block:()->Void) {
        
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        
        if token != 0{
            return
        }
        token = 1
        
        block()
        
    }
    
}

