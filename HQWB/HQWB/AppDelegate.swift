//
//  AppDelegate.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/2/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // appearance - 统一设置
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        // 1.创建Window
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // 2. 给window一个根控制器
        window?.rootViewController = MainViewController()
        // 3.把window设置可见
        window?.makeKeyAndVisible()
        
        
//        MainViewController().addChildViewController(<#T##childVc: UIViewController##UIViewController#>, title: <#T##String#>, imageName: <#T##String#>, SelectImageName: <#T##String#>)
        
        
        
        return true
    }

    
    // 
    
   
}

