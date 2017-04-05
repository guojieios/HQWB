//
//  OAuthViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/13.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        https://api.weibo.com/oauth2/authorize?client_id=453636876&redirect_uri=http://www.makeru.com.cn/
        
        // 设置代理
        self.webView.delegate = self
        
        SetUpNavItem()
        
        
        
        loadPage()
        
    }
    
}


// UI设置
extension OAuthViewController {
    
    
    func SetUpNavItem() {
        
        // 1.设置左侧的item
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "leftButtonClick")
        
        
        // 2.设置右边的item
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .Plain, target: self, action: "rightButtonClick")
        
        
        
        // 3.设置标题
        title = "登录"
        
        
    }
    
    
    
    func loadPage() {
        
        //  字符串链接
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(app_key)&redirect_uri=\(redirect_uri)"
        
        // 链接
        guard let url = NSURL(string: urlString) else {
            
            return
        }
        
        
        
        // 请求
        let request = NSURLRequest(URL: url)
        
        // 加载网页
        webView.loadRequest(request)
        
        
        
    }
    
    
    
}



// 点击事件
extension OAuthViewController {
    
    @objc private func leftButtonClick() {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    
    @objc private func rightButtonClick() {
        
        
        // 点击填充 - 输入用户名与密码
        let JSCode = "document.getElementById('userId').value='18101063120';document.getElementById('passwd').value='940624000gj';"
        
        
        
        webView.stringByEvaluatingJavaScriptFromString(JSCode)
        
        
        
        
    }
    
    
}



// WebView的代理方法

extension OAuthViewController : UIWebViewDelegate {
    
    // 开始加载网页
    func webViewDidStartLoad(webView: UIWebView) {
        
        SVProgressHUD.show()
        
        
    }
    
    // 结束加载网页
    func webViewDidFinishLoad(webView: UIWebView) {
     
        SVProgressHUD.dismiss()
        
    }
    
    // 出现错误
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        SVProgressHUD.dismiss()
    }
    
    // 发送请求 调用
    // false : -> 不在加载界面  true: -> 继续加载页面 ----  回调地址，如果URL存在，那么停止加载回调地址
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
//        print(request.URL)
        
        
        // 截取字符串
        // 1. 获取到链接
        guard let url = request.URL else {
             return true
            
        }
        
        
        // 2.获取链接字符串
        let urlString = url.absoluteString
        
        // 2.1 判断 code 是否存在
        guard urlString.containsString("code=") else {
            
            return true
            
        }
        
        // 3.截取 code= xxxxx
        let code = urlString.componentsSeparatedByString("code=").last!
        
        
        
        // 获取 accesstoken 的值
        loadAccessToken(code)
        
//        print(code)
    
        return false
    }
    
    
    
    
    
}

// 请求数据
extension OAuthViewController {
    
    private func loadAccessToken(code : String) {
        
        // 获取AccessToken的值 - 调用 网络工具类 中方法
        
        NetworkTools.ShareInstance.loadAcessToken(code) { (result, error) in
            // 1.校验错误
            if error != nil {
                
                print(error)
                return
                
            }
            
            // 2. 输出result
            guard let AccountDict = result else {
                
                
                print("没有获取到结果")
                
                return
                
            }
            
            // 3.  将result 字典 转换成模型
            // 获取到 account的信息
            let account = UserAccount(dict: AccountDict)
            
            print(account)
            
            
            // 4. 获取用户的信息
            self.loadUserInfo(account)
        }
        
    
        
    }
    
    
    // 获取用户信息 - 调用 方法
    private func loadUserInfo(account : UserAccount) {
        
    // 1. 获取 access_token
        guard let access_tokens = account.access_token else {
            
            return
        }
        
        
        
        // 2. 获取 uid
        guard let uids = account.uid else {
            
            
            return
        }
        
        
        // 3. 调用方法，获取用户信息

        NetworkTools.ShareInstance.loadUserInfo(access_tokens, uid: uids) { (result, error) in
            
            // 校验
            if error != nil {
                
                print(error)
                return
                
            }
            
            
            // 2. 拿到用户信息  - 校验
            guard let UserDict = result else {
                
                print("没有获取到信息")
                
                return
            }
            
            print(result)
            
            // 3.从字典中获取 用户的信息
            let UserIcon = UserDict["profile_image_url"] as? String
            let screenName = UserDict["screen_name"] as? String
            
            // 赋值
            account.userIcon = UserIcon
            account.screenName = screenName
            
            
//            print(account)
            
            
            
            // 4. 存储 用户的信息  - 归档和接档
            
            // 4.1 获取沙盒路径
            var accountPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
            
            // 4.2 拼接文件名称 --- 获取文件路径
            accountPath = (accountPath as NSString).stringByAppendingPathComponent("account.plist")
            
            
            print(accountPath)
            
            // 4.3 存取文件
            NSKeyedArchiver.archiveRootObject(account, toFile: accountPath)
            
            
            // 注意： 将account 设置到单例对象中去
            UserAccountTools.ShareInstance.account = account
            
            
            // 5.0 清除 登录界面
            self.dismissViewControllerAnimated(false, completion: {
                
                // 5.1 调用欢迎界面
                UIApplication.sharedApplication().keyWindow?.rootViewController = WelcomeViewController()
                
                
                
                
            })
            
            
            
            
            
        }
        
    }
    
    
    
    
}




