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
    
    

    
    // 重写构造方法
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
}



