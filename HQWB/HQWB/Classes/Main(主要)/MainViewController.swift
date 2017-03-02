//
//  MainViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/2/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    // 需要字符串数组存取 图片名称
//    // Swift 中懒加载
//   private lazy var imageNames = ["tabbar_home","tabbar_message_center","","tabbar_discover","tabbar_profile"]
    
//   private lazy var composeButton = UIButton.creatButton("tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
       private lazy var composeButton = UIButton(imageName: "tabbar_compose_icon_add",bgImageName: "tabbar_compose_button")

   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // 设置 发布按钮
        // 1. 添加到视图中
        tabBar.addSubview(composeButton)
        
        
        // 3. 设置位置
        composeButton.center = CGPointMake(tabBar.center.x, tabBar.bounds.size.height * 0.5)
       
        
        
        }
        
    
    
    
//    
//    override func viewWillAppear(animated: Bool) {
//        
//        super.viewWillAppear(animated)
//        
//        // 用代码设置 items 的选中图片
//        
//        // 1.遍历items
//        for i in 0..<tabBar.items!.count {
//            
//            
//            // 2.拿到item
//            let item = tabBar.items![i]
//            
//            // 设置中间按钮 不与用户交互
//            if(i == 2) {
//                
//                item.enabled = false
//                
//                continue
//                
//            }
//            
//            
//            // 3.设置高亮状态
//            
//            item.selectedImage = UIImage(named: imageNames[i] + "_highlighted")
//        
//        
//    }
//    }
    
 
    
}
