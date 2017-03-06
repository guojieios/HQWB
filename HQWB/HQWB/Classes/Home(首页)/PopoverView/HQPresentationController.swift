//
//  HQPresentationController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/6.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class HQPresentationController: UIPresentationController {

    
    private lazy var coverView : UIView = UIView()
    
    override func containerViewWillLayoutSubviews() {
        
        // 设置frame
        
        presentedView()?.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width * 0.5 - 75,65, 150, 250)
        // 添加蒙版
        setCoverView()
        
    }
    
    
}


// UI
extension HQPresentationController {
    
    func setCoverView() {
        
        // 1. 添加蒙版
//        containerView?.addSubview(coverView)
//        containerView?.insertSubview(coverView, belowSubview: <#T##UIView#>)
        containerView?.insertSubview(coverView, atIndex: 0)
        
        
        // 2.设置大小与颜色
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
        
        coverView.frame = containerView!.bounds
        
        
        // 3. 蒙版添加手势
        let CoverGesture = UITapGestureRecognizer(target: self, action: "CoverGestureClcik")
        
        coverView.addGestureRecognizer(CoverGesture)
      
        
    }
    
    
}


// 响应事件
extension HQPresentationController {
    
    @objc private func CoverGestureClcik() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    
}










