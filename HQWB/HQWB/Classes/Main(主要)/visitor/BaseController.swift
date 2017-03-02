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
    
    
    var isLogin : Bool = false
    
    
    override func loadView() {
        // 调用父类的方法
        
        //        isLogin ? super.loadView() : 加载visiterView
        isLogin ? super.loadView() : setUpView()
        
        
    }

    
    

}
// UI设置
extension BaseController {
    
    func setUpView() {
        
//        visiterView.backgroundColor  = UIColor.redColor()
        
        // 创建的view 赋值
        view = visiterView
        
}
}
