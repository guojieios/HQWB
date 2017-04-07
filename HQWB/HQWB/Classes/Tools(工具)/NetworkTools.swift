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



// 封装网络请求方法
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
//                print(result)
                finished(result: result, error: nil)
            }) { (task : NSURLSessionDataTask?, error : NSError) in
//                print(error)
                finished(result: nil, error: error)
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




// 获取用户的信息
extension NetworkTools {
    
     func loadUserInfo(access_token : String,uid : String,finished : (result : [String : AnyObject]?,error : NSError?)->()) {
        
        
        // 1. 链接
        let urlString = "https://api.weibo.com/2/users/show.json"
        
        // 2. 参数
        let parames = ["access_token" : access_token , "uid" : uid]
        
        
        // 3. 请求
        request(.GET, usrString: urlString, parameters: parames) { (result, error) in
            
            finished(result: result as? [String : AnyObject], error: error)
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}




// 获取首页的信息
extension NetworkTools {
    
    func loadStatues(since_id : Int,max_id : Int,finisded : (result : [[String : AnyObject]]?,error : NSError?)->()) {
        
        // 1. 链接
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        
        
        //2. 请求参数
        let parameters = ["access_token" : (UserAccountTools.ShareInstance.account?.access_token)!,"since_id" : "\(since_id)","max_id" : "\(max_id)"]
        
        
        
        // 3.发送请求
        request(.GET, usrString: urlString, parameters: parameters) { (result, error) in
            
            
            // 1.获取字典的数据
            guard let resultDict = result as? [String : AnyObject] else {
                
                finisded(result: nil, error: error)
                
                
                return
                
            }
            
            
            // 2.将  数组数据 回调 给外部
            finisded(result: resultDict["statuses"] as? [[String : AnyObject]], error: nil)
            
            
        }
        
        
        
        
        
    }
    
    
}


// 发送文字微博
extension NetworkTools {
    
    func sendStatus(statusText : String, isSuccess : (isSuccess : Bool)->()) {
        
        // 1. 获取链接
        let urlString = "https://api.weibo.com/2/statuses/update.json"
        
        
        // 2. 设置 请求参数
        let parameter = ["access_token" : (UserAccountTools.ShareInstance.account?.access_token)!,"status" : statusText]
        
        
        // 3. 发送网络请求
        request(.POST, usrString: urlString, parameters: parameter) { (result, error) in
            
            if result != nil {
                
                isSuccess(isSuccess: true)
                
            } else {
                
                isSuccess(isSuccess: false)
            }
            
            
            
        }
        
    
        
    }
    
    
    
}


// 发送图片微博
extension NetworkTools {
    
    func sendStatus(statusText : String,image : UIImage, isSuccess : (isSuccess : Bool)->()) {
        
        // 1. 获取链接
        let urlString = "https://api.weibo.com/2/statuses/upload.json"
        
        
        // 2. 设置 请求参数
        let parameter = ["access_token" : (UserAccountTools.ShareInstance.account?.access_token)!,"status" : statusText]
        
        // 3.发送网络请求
        POST(urlString, parameters: parameter, constructingBodyWithBlock: { (formData) -> Void in
            
            if let imageData = UIImageJPEGRepresentation(image, 0.5) {
                formData.appendPartWithFileData(imageData, name: "pic", fileName: "123.jpeg", mimeType: "image/jpeg")
            }
            
            }, progress: nil, success: { (_, _) -> Void in
                isSuccess(isSuccess: true)
        }) { (_, error) -> Void in
            print(error)
        }
//        POST(urlString, parameters: parameter, constructingBodyWithBlock: { (formData) in
//            
//            // 转换
//            if let imageData = UIImageJPEGRepresentation(image, 0.5) {
//                
//                
//                formData.appendPartWithFileData(imageData, name: "pic", fileName: "123.jpg", mimeType: "image/jpg")
//            }
//
//            }, progress: nil, success: { (_, _) in
//                 isSuccess(isSuccess: true)
//            }) { (_, error) in
//                print(error)
//        }
        
    }
    
    
}




