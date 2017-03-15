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
        
        // MARK: - 编码格式修改  text/plain
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
         tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
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




// 请求 AccessToken 的值
extension NetworkTools {
    func loadAcessToken(code : String, finished : (result : [String : AnyObject]?,error : NSError?)->()) {
        
        // 1. 获取请求链接
        let urlSting = "https://api.weibo.com/oauth2/access_token"
        
        
        // 2. 获取请求的参数
        let parameters = ["client_id" : app_key, "client_secret" : App_Secret, "grant_type" : "authorization_code", "code" : code, "redirect_uri" : redirect_uri]
        
        
        // 3.发送网络请求
        request(.POST, usrString: urlSting, parameters: parameters) { (result, error) in
            
            // 闭包中显示的是结果
            finished(result: result as? [String : AnyObject], error: error)
            
            
        }
        
        
        
        
        
    }
    
    
}



