//
//  ComposeViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/4/5.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textView: composeTextView!
    // 懒加载 属性
    private lazy var titleView : composeTitleView = composeTitleView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 设置 导航控制栏
        setUpNavgiationBar()
        
        
        
    }

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        textView.becomeFirstResponder()
        
        
    }
    

}



// 设置 UI
extension ComposeViewController {
    
    
    // 设置 导航栏
    private func setUpNavgiationBar() {
        
        // 设置左边 按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "closeButtonClick")
        // 设置右边 按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发布", style: .Plain, target: self, action: "composeButtonClick")
        
        // 设置发布按钮，默认不能点击
        navigationItem.rightBarButtonItem?.enabled = false
        
        
    
        // 2. 添加 title视图
        titleView.frame = CGRectMake(0, 0, 100, 40)
        navigationItem.titleView = titleView
        
        
        
    }
    
    
}

// 事件响应
extension ComposeViewController {
    
    // 关闭
    @objc private func closeButtonClick() {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // 发布
    @objc private func composeButtonClick() {
        
        print("发布")
        
        
    }
    
    
    
    
    
}



// textView 代理
extension ComposeViewController : UITextViewDelegate {
    
    func textViewDidChange(textView: UITextView) {
        
        // 背景文字取消掉
        self.textView.placeholderLabel.hidden = textView.hasText()
        
        // 发布按钮 打开
        navigationItem.rightBarButtonItem?.enabled = textView.hasText()
        
        
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        textView.resignFirstResponder()
    }
    
    
}






