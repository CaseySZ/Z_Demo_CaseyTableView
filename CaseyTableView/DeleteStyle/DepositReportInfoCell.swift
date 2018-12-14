//
//  ReportInfoCell.swift
//  PersonReport
//
//  Created by Casey on 07/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class DepositReportInfoCell: UITableViewCell {

    let editButton =  CellEditButton()
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        editButton.setTitle("新的style", for: .normal)
        editButton.titleLabel?.numberOfLines = 0
        editButton.setTitleColor(.red, for: .normal)
    }
    
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if let targertView = self.searchSubViewOfClassName("UITableViewCellEditControl") {
            
            targertView.isHidden = true
            editButton.isHidden = false
        
            editButton.removeFromSuperview()
            editButton.frame = targertView.frame
            self.addSubview(editButton)
            
            
        }else {
            
            editButton.isSelected = false
            editButton.isHidden = true
          
        }
        
    }
    
  

    
    
    
}
