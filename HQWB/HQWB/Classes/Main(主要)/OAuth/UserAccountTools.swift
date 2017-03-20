//
//  UserAccountTools.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/20.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class UserAccountTools {

    
    
    // 创建单例文件
    static let  ShareInstance : UserAccountTools = UserAccountTools()
    
    
    var account : UserAccount?
    
    
    
    // Swift - --  计算属性
    var accountPath : String {
        
        // 获取沙盒路径
        // 4.1 获取沙盒路径
        let accountPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        
        // 4.2 拼接文件名称 --- 获取文件路径
        

        return (accountPath as NSString).stringByAppendingPathComponent("account.plist")
        
    }
    
    
    
    
    init() {
        
        // 2. 接档文件 - 获取信息
        account = NSKeyedUnarchiver.unarchiveObjectWithFile(accountPath) as? UserAccount

        
        
        
        
    }
    
    
    // 计算属性
    var isLogin : Bool {
        
        
        if account == nil {
            
            return false
            
        }
        
        
        guard let expridate = account?.expires_date else {
            
            
            return false
        }
        
        
        // 比较 时间
        return expridate.compare(NSDate()) == NSComparisonResult.OrderedDescending
        

        
        
    }
    

    
    
    
    
    
    
    
    
    
}
