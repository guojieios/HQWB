//
//  MainViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/2/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
       
        
        
        // 调用方法，传入参数
       
        addChildViewController("HomeViewController", title: "首页", imageName: "tabbar_home", SelectImageName: "tabbar_home_highlighted")
        addChildViewController("DiscoverViewController", title: "发现", imageName: "tabbar_discover", SelectImageName: "tabbar_discover_highlighted")
        addChildViewController("MessageViewController", title: "消息", imageName: "tabbar_message_center", SelectImageName: "tabbar_message_center_highlighted")
        addChildViewController("ProfileViewController", title: "我", imageName: "tabbar_profile", SelectImageName: "tabbar_profile_highlighted")
        
//        HomeViewController()
        print(HomeViewController())
        // <HQWB.HomeViewController: 0x7fe8d8e32830>
        // HQWB : 命名空间 -- ： Jerry ： 华清远见公司
        
    }

   
    // Swift中 支持方法的重载的 ----  OC中不支持
    // 方法的重载 : 方法名相同，但是参数不同 --- 1.参数类型不同 2. 参数个数不同
    // 方法不能随便调用 ----  变成私有方法
    private func addChildViewController(childVcStr: String,title : String,imageName : String,SelectImageName : String) {
        
        // 0. 获取到字符串的命名空间
        // ? : 可选类型  ---  可能是nil
        // ! : 强制解包  ---  前提 - 包内一定有内容
        
        guard let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as? String else {
            
            print("没有获取命名空间")
            return
            
        }
        
//        print(nameSpace)
        
        
        
        // 校验 - guard
        // 1.获取到字符串对象的class
        guard let childVcClass = NSClassFromString(nameSpace + "." + childVcStr) else {
            
            
            print("没有获取到想的class")
            return
            
        }
        
        print("获取到相应的class")
        
        
        // 获取到 字符串 对应的控制器 -- 把字符串转换成控制器类型
        guard let childVcType = childVcClass as? UIViewController.Type else {
            
            print("没有转换成功")
            
            return
        }
        
        //3.创建对应的控制器对象
        let childVc = childVcType.init()
        
        
        
        // 设置子控制器的属性
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        childVc.tabBarItem.selectedImage = UIImage(named: SelectImageName)
        
        // 设置导航控制器
        let childNav = UINavigationController(rootViewController: childVc)
        
        
        // 添加导航控制器
        addChildViewController(childNav)
        
        
        
    }
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
