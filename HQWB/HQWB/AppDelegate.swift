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
        
//        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        print(UserAccountTools.ShareInstance.account?.access_token)
        
        
        
        // appearance - 统一设置
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        
        return true
    }

    
    // 
    
   
}

