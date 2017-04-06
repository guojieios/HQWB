//
//  composeTextView.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/4/6.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class composeTextView: UITextView {

    
    // 懒加载 label
    lazy var placeholderLabel : UILabel = UILabel()
    
   // 添加 子控件的时候
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        setUpUI()
        
        
        
    }
    
    
    
    
    
    
    
    
//    // 给子控件设置属性
//    override func awakeFromNib() {
//        <#code#>
//    }
    
    
    
}



// UI设置
extension composeTextView {
    
    private func setUpUI() {
        // 1. 添加子控件
        addSubview(placeholderLabel)
        
        // 2. 设置子控件的frame
        placeholderLabel.snp_makeConstraints { (make) in
            make.top.equalTo(8)
            make.left.equalTo(10)
        }
        
        // 3. 设置属性
        placeholderLabel.font = font
        placeholderLabel.textColor = UIColor.lightGrayColor()
        
        
        // 4.设置 文字
        placeholderLabel.text = "分享新鲜事！"
        
        
        // 5.设置内容的内边距
        textContainerInset = UIEdgeInsets(top: 7, left: 7, bottom: 0, right: 7)
        
        
        
        
    }
    
    
}



