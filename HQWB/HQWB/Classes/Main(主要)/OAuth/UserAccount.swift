//
//  UserAccount.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/20.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class UserAccount: NSObject {
    
    
    /**
     *  属性
     */
    // 授权的Access_token
    var access_token : String?
    
    // expires_in - 过期秒数 --> 秒
    var expires_in : NSTimeInterval = 0.0 {
        // 属性 监听 机制
        didSet {
            
            // 转换成 距离现在 有多少时间
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
            
            
        }
        
    }
    
    
    // uid  - 用户ID
    var uid : String?
    
    
    // 过期时间
    var expires_date : NSDate?
    
    
    
    
    // 自定义 构造函数

    
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        
        
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
    
    
    
    // OC 中一般重写 description 属性
    override var description: String {
        
//        return "Access_token=\(access_token),expires_in=\(expires_in)"
        
        
        // 模型转字典
        return dictionaryWithValuesForKeys(["access_token","expires_date","uid"]).description
    }
    
    
    
    
    
    
    

}
