//
//  BaseController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/2.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class BaseController: UITableViewController {
    
    
    
    // 创建 view
    lazy var visiterView = VisitorView.setUpVisitorView()
    
    
    var isLogin : Bool = true
    
    
    override func loadView() {
        // 调用父类的方法
        
        //        isLogin ? super.loadView() : 加载visiterView
        isLogin ? super.loadView() : setUpView()
        
        setNavigationItems()
        
    }

    
    

}
// UI设置
extension BaseController {
    
    func setUpView() {
        
//        visiterView.backgroundColor  = UIColor.redColor()
        
        // 创建的view 赋值
        view = visiterView
        
        visiterView.registerBtn.addTarget(self, action: "navLeftItemClick", forControlEvents: .TouchUpInside)
        visiterView.loginBtn.addTarget(self, action: "navRightItemClick", forControlEvents: .TouchUpInside)
        
        
}
    
    // MARK:-设置导航栏的按钮
    func setNavigationItems() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "navLeftItemClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "navRightItemClick")
        
        
        
        
        
        
    }
  
    
    
}




// 事件监听
extension BaseController {
    
    // 左边注册按钮 
    // private -- 函数受保护，函数名在调用的时候，没有办法转换成@SEL 格式，可以加上@objc，转换成@SEL格式
  @objc private func navLeftItemClick() {
        
        print("left")
        
    }
    
    // 右边登录按钮
 @objc private func navRightItemClick() {
        
         print("right")
        
    }
    
}















