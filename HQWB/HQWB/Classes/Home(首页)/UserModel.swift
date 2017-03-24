//
//  UserModel.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/24.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class UserModel: NSObject {
    
    
    var screen_name : String?         // 用户名
    
    
    var profile_image_url : String?    // 用户头像
    
    
    var verified_type : Int = -1       // 用户认证
    
    var mbrank : Int = 0              //用户等级
    
    //自定义构造函数
    
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
    

}
