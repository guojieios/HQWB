//
//  ComposeViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/4/5.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: composeTextView!
    // 懒加载 属性
    private lazy var titleView : composeTitleView = composeTitleView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 设置 导航控制栏
        setUpNavgiationBar()
        
        
        
        
        // 监听 键盘
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "KeyboardWillChangeFrame:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        
        
        
    }

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        textView.becomeFirstResponder()
        
        
    }
    
    
    
    // 消去 通知
    deinit {
        
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
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
    
    
    @objc private func KeyboardWillChangeFrame(note : NSNotification) {
      // 1. 获取键盘的动画时间
        let duration = note.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        
        
        // 2.获取键盘最终的y值
        let endFrame = (note.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let y = endFrame.origin.y
        
        
        // 3.计算底部工具栏的高度
        let margin = UIScreen.mainScreen().bounds.height - y
        
        
        // 4.设置底部工具栏
        bottomConstraint.constant = margin
        UIView.animateWithDuration(duration) { 
            self.view.layoutIfNeeded()
        }
        
        
        
        
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






