//
//  StatuesViewModel.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class StatuesViewModel: NSObject {
    
    // 获取 模型 数据 -- 属性
    var statues : StatuesModel?
    
    
    var creatAtText : String?   // 对时间来源的处理
    
  
    var sourceText : String?       // 微博来源 字符串 --- 处理过的

    
    var verifiedImage : UIImage?   // 认证 图片 处理
    var vipImage : UIImage?         // 微博 等级 处理
    

    
    // 自定义构造函数
    init(status : StatuesModel) {
        self.statues = status
        
        // 对属性 进行数据处理
        
        // 1. 对 微博来源 处理
        // 1. nil -- 校验
//        guard let source = source where source != ""  else {
//            return
//        }
        
        if let source = status.source where status.source != "" {
            
            // 2.对来源的字符串 处理
            //            "<a href="http://app.weibo.com/t/feed/6vtZb0" rel="nofollow">微博 weibo.com</a>"
            
            let startIndex = (source as NSString).rangeOfString(">").location + 1
            // 需要截取字符串的长度
            let long = (source as NSString).rangeOfString("</").location - startIndex
            
            
            // 3. 截取字符串
            sourceText = (source as NSString).substringWithRange(NSRange(location: startIndex, length: long))
            
            
        }
        
        
        
        
        // 2. 对 微博 时间 处理
     

        
        // 3. 微博 认证 处理
        
        let verified_type = status.user?.verified_type ?? -1
        
        
        switch verified_type {
        case 0:
            verifiedImage = UIImage(named: "avatar_vip")
        case 2,3,5:
            verifiedImage = UIImage(named: "avatar_grassroot")
        case 220:
            verifiedImage = UIImage(named: "avatar_enterprise_vip")
        default:
            verifiedImage = nil
        }
        

        // 4. 微博 等级 处理
        let mbrank = status.user?.mbrank ?? 0
        
        if mbrank >= 1 && mbrank <= 6 {
            
            
            vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
            
        }

        
    }
    
    

}
