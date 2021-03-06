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

        composeBtn()
        
        
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

// 对控制器的UI 扩至
extension MainViewController {
    
    func composeBtn() {
        
  
    // 设置 发布按钮
    // 1. 添加到视图中
    tabBar.addSubview(composeButton)
    
    
    // 2. 设置位置
    composeButton.center = CGPointMake(tabBar.center.x, tabBar.bounds.size.height * 0.5)
    
    // 3.响应点击事件
    // ction: <#T##Selector#> ： @SEL -
        // Swift中事件执行 ： 1.Selector("setUpComposeBtnClick")   2. "setUpComposeBtnClick"
       composeButton.addTarget(self, action: "setUpComposeBtnClick" , forControlEvents: .TouchUpInside)
        
        
        
      }
}


// 点击事件
extension MainViewController {
    
    func setUpComposeBtnClick() {
     // 点击 弹出一个 view
        // 1. 创建一个 发布控制器
        let composeVC = ComposeViewController()
        
        
        // 2. 包装导航控制器
        let composeNav = UINavigationController(rootViewController: composeVC)
        
        
        
        // 3. 弹出 发布控制器
        presentViewController(composeNav, animated: true, completion: nil)
        
        
        
        
    }
    
    
    
}


