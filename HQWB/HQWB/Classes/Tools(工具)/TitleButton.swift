//
//  TitleButton.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/6.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    
    // 自定义button
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Selected)
        // 设置大小
        sizeToFit()
        
        
    }

    
    // ?    Swift中规定：重新控件的init/init：frame方法，必须加上下面的方法，这个方法可以为空
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        // OC中控件的frame，是不可以直接修改，但是Swift中可以直接修改控件的成员变量
        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.x = titleLabel!.frame.size.width + 5
        
    }
    
    
    
    

}
