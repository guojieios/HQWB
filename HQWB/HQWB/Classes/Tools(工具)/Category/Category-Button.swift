//
//  Category-Button.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/2.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit


// Swift - extension
// Swift中使用类方法 创建 --- class   ------ OC中 +
extension UIButton {
    /*
    class func creatButton(imageName : String, bgImageName : String) -> UIButton {
        
        
        // 1. 创建按钮
        // let/var  --- 创建按钮，如果创建出的控件不做任何改变 - 用let创建，否则用var
        let button = UIButton()
        
        // 2、设置 按钮
        // 2. 设置图片
        button.setBackgroundImage(UIImage(named: bgImageName), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: bgImageName), forState: .Highlighted)
        button.setImage(UIImage(named: imageName), forState: .Normal)
        button.setImage(UIImage(named: imageName), forState: .Highlighted)
        
        // 设置大小
        button.sizeToFit()

        
        
        // 3.返回 button
        return button

        
        
        
    }
    */

/*
    // 重写 button的构造方法
    // Swift - 构造方法 返回值系统默认返回
    // convenience : 便利、方便  -----  便利构造函数
    // 便利构造函数 ： 用convenience 修饰的构造函数
    // 作用 ： 一般用在对系统的类进行构造函数扩展的时候使用
    // 便利构造函数 使用：
         1. 必须重写构造方法
         2. 必须写在extension里
         3. 便利构造函数前面必须用convenience
    
  */
    convenience init(imageName : String, bgImageName : String) {
        self.init()
        
        setBackgroundImage(UIImage(named: bgImageName), forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: bgImageName), forState: .Highlighted)
        setImage(UIImage(named: imageName), forState: .Normal)
        setImage(UIImage(named: imageName), forState: .Highlighted)

        // 设置大小
        sizeToFit()
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}