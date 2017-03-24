//
//  StatuesModel.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/22.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class StatuesModel: NSObject {
    
    // 创建时间
    var created_at : String? {
        
        didSet {
            
            // 1. 空值校验
            guard let created_at = created_at else {
                
                return
                
                
            }
            
            
            // 2. 对时间 设置
            
            creatAtText = NSDate.createdTimeWithString(created_at)
            
        }
        
        
    }
    // 微博正文
    var text : String?
    // 微博来源
    var source : String?  {
        
        didSet {
            
            // 1. nil -- 校验
            guard let source = source where source != ""  else {
                return
            }
            
            
            // 2.对来源的字符串 处理
//            "<a href="http://app.weibo.com/t/feed/6vtZb0" rel="nofollow">微博 weibo.com</a>"
            
            let startIndex = (source as NSString).rangeOfString(">").location + 1
            // 需要截取字符串的长度
            let long = (source as NSString).rangeOfString("</").location - startIndex
            
            
            // 3. 截取字符串
            sourceText = (source as NSString).substringWithRange(NSRange(location: startIndex, length: long))
            
            
            
            
            
        }
        
    }
    
    // 微博来源 字符串 --- 处理过的
    var sourceText : String?
    
    var creatAtText : String?
    
    
    // 用户信息
    var user : UserModel?
    
    
    
    // 微博ID
    var mid : Int = 0
    
    
    

    
    // 重写构造方法
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        print(sourceText)
        print(source)
        
        
        // 1.将 用户（user） 字典转换成 用户模型对象(userModel)
        if let userDict = dict["user"] as? [String : AnyObject] {
            
            user = UserModel(dict: userDict)
        }
        
        
        
        
        
        
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
}



