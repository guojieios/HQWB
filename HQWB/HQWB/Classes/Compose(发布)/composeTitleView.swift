//
//  composeTitleView.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/4/5.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit
import SnapKit

class composeTitleView: UIView {


    // 懒加载 属性
    private lazy var titleLabel : UILabel = UILabel()
    private lazy var screenNameLabel : UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        setUpTitle()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    
}


// 设置 UI
extension composeTitleView {
    
    private func setUpTitle() {
        
        // 1. 添加子控件
        addSubview(titleLabel)
        addSubview(screenNameLabel)
        
        
        // 2. 设置子控件 frame
        titleLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self)
        }
        screenNameLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(titleLabel.snp_centerX)
            
            make.top.equalTo(titleLabel.snp_bottom).offset(3)
        }
        
        
        // 3.设置 控件的属性
        titleLabel.font = UIFont.systemFontOfSize(16.0)
        screenNameLabel.font = UIFont.systemFontOfSize(14.0)
        screenNameLabel.textColor = UIColor.lightGrayColor()
        
        
        
        // 4.设置文字
        titleLabel.text = "发微博"
        screenNameLabel.text = UserAccountTools.ShareInstance.account?.screenName
        
        
        
        
        
        
        
    }
    
    
}
