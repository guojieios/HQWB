//
//  NSDate-Extension.swift
//  微博时间设置
//
//  Created by Jerry_hqyj on 17/3/23.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import Foundation


extension NSDate {
    
    class func createdTimeWithString(timeString : String) -> String {
        
        // 1.创建时间格式化对象
        let fmt = NSDateFormatter()
        // 1.1 设置时区
        fmt.locale = NSLocale(localeIdentifier: "en")
        // 1.2 获取 源数据的时间格式
        fmt.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        
        // 2. 获取时间
        guard let createDate = fmt.dateFromString(timeString) else {
            
            return ""
        }
        
        // 3. 当前时间
        let nowDate = NSDate()
        
        
        // 4. 获取 当前时间与数据时间的差值
        let interval = Int(nowDate.timeIntervalSinceDate(createDate))
        
        
        
        
        // 5. 判断 差值
        // 5.1 一分钟内
        if interval < 60 {
            
          
            return "刚刚"
            
        }
        
        // 5.2 一个小时内
        if  interval < 60 * 60  {
           
            return "\(interval / 60)分钟前"
        }
        
        
        // 5.3 一天内
        if interval < 60 * 60 * 24 {
         
            
            
            return "\(interval / 60 / 60)小时前"
        }
        
        
        // 5.4 其他时间的显示
        // 创建日期对象
        let calendar = NSCalendar.currentCalendar()
        
        
        // 5.4.1 昨天显示
        if calendar.isDateInYesterday(createDate) {
            
            // 自定义 时间显示格式
            fmt.dateFormat = "HH:mm"
            let timeString = fmt.stringFromDate(createDate)
            
            
            
          
            return "昨天\(timeString)"
            
            
        }
        
        // 5.4.2 一年内显示
        let cpns = calendar.components(NSCalendarUnit.Year, fromDate: createDate, toDate: nowDate, options: [])
        
        if cpns.year < 1 {
            
            // 时间显示格式
            fmt.dateFormat = "MM-dd HH:mm"
            let timeString = fmt.stringFromDate(createDate)
            
            
            
        
            
            return timeString
        }
        
        
        
        // 5.4.3 一年外的
        fmt.dateFormat = "yyyy-MM-dd HH:mm"
        let timeString = fmt.stringFromDate(createDate)
        
        
   
        
        return timeString
        
        
        

        
        
        
    }
    
    
}
