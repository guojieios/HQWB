//
//  NetworkTools.swift
//  AFNetWorking封装
//
//  Created by Jerry_hqyj on 17/3/13.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import AFNetworking

enum RequestType : String{
    case GET = "GET"
    case POST = "POST"
}


class NetworkTools: AFHTTPSessionManager {
    
    // 单例
    // let ： 保证线程安全
//    static let ShareInstance : NetworkTools = NetworkTools()
    
    static let ShareInstance : NetworkTools = {
     let tools = NetworkTools()
        
        // MARK: - 编码格式修改
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        
        return tools
    
    }()
    
    
    

}




extension NetworkTools {
    
    // 请求封装
    func request(methodType : RequestType, usrString : String, parameters : [String : AnyObject],finished : (result : AnyObject?,error : NSError?) -> ()) {
        
        
        // 判断 请求方式
        if (methodType == .GET) {
            
            
            GET(usrString, parameters: parameters, success: { (task : NSURLSessionDataTask, result : AnyObject?) in
                
                
                
//                print(result)
                
                finished(result : result,error: nil)
                
                
                
            }) { (task : NSURLSessionDataTask?, error : NSError) in
                print(error)
                
                finished(result: nil,error: error)
                
            }
            
        } else {
            
            
            
            POST(usrString, parameters: parameters, progress: nil, success: { ( task : NSURLSessionDataTask, result : AnyObject?) in
                print(result)
            }) { (task : NSURLSessionDataTask?, error : NSError) in
                print(error)
            }
            
            
        }
        
        
        
        
    }
    
    
    
}