//
//  OAuthViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/13.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        https://api.weibo.com/oauth2/authorize?client_id=453636876&redirect_uri=http://www.makeru.com.cn/
        
        
        
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
        
        print("填充")
        
        
    }
    
    
}



