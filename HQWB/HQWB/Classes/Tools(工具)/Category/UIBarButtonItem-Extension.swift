//
//  UIBarButtonItem-Extension.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/6.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    convenience init(imageName : String) {
        self.init()
        
        // 设置内容
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        btn.sizeToFit()
        
        
        self.customView = btn

        
        
    }
    
    
    
}


