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
    var created_at : String? 
    // 微博正文
    var text : String?
    // 微博来源
    var source : String?  
    
    // 用户信息
    var user : UserModel?

    // 微博ID
    var mid : Int = 0
    
    
    // 获取 图片
    var pic_urls : [[String : String]]?
    
    

    // 重写构造方法
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        // 1.将 用户（user） 字典转换成 用户模型对象(userModel)
        if let userDict = dict["user"] as? [String : AnyObject] {
            
            user = UserModel(dict: userDict)
        }
        
        
        
        
        
        
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
}



