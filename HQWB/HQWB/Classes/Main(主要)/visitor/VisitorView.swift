//
//  VisitorView.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/2.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    
    // 对 访客视图操作
    // 快速加载 xib  - 类
    class func setUpVisitorView() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }
    
    
    
    @IBOutlet weak var rotationView: UIImageView!
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    // 创建方法 - 修改控件的属性
    func setUpVisitorViewInfo(iconViewName : String,title : String) {
        
        // 转盘关掉
        rotationView.hidden = true;
        // 设置控件的属性
        iconView.image = UIImage(named: iconViewName)
        tipLabel.text = title
        
        
    }
    
    
    
    
    
    //  rotationView 添加动画
    func addRotationAnimation() {
        
        
        // 1.创建动画
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        
    
        
        // 2.设置动画属性
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = 2 * M_PI
        rotationAnimation.repeatCount = MAXFLOAT
        rotationAnimation.duration = 5
        // 设置移除动画
       rotationAnimation.removedOnCompletion = false
        
        
        // 3.将动画添加到视图中
        rotationView.layer.addAnimation(rotationAnimation, forKey: nil)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}
