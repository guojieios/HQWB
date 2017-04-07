//
//  ComposeViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/4/5.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit
import SVProgressHUD

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: composeTextView!
    
    @IBOutlet weak var picPickerView: PicPickerCollectionView!
    
    // 存取图片的数组
    private lazy var imageArray : [UIImage] = [UIImage]()
    
    
    // 懒加载 属性
    private lazy var titleView : composeTitleView = composeTitleView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 设置 导航控制栏
        setUpNavgiationBar()
        
        
        // 执行通知
        setUpNotification()
     
        
        
        
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
    
    
    // 通知
    private func setUpNotification() {
        
        
        // 监听 键盘
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "KeyboardWillChangeFrame:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addPhotosClick", name: PicPickerAddPhotoNote, object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "removePhotosClick:", name: PicPickerRemovPhotoNote, object: nil)
        
        
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
        
        
        // 0. 退出键盘
        textView.resignFirstResponder()
        
        
        // 1.获取发送微博的内容
        let statusText = textView.text
        
        // 2. 发送网络请求
        NetworkTools.ShareInstance.sendStatus(statusText) { (isSuccess) in
            
            if !isSuccess {
                
                SVProgressHUD.showErrorWithStatus("微博发送失败！！")
                
                
                return
            }
                
            
            
            SVProgressHUD.showSuccessWithStatus("微博发送成功！！")
             self.dismissViewControllerAnimated(true, completion: nil)
          
            
            
        }
        
        
        
        
        
        
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
    
    
    
    // 显示图片 按钮点击
    @IBAction func picPickerBtnClick(sender: AnyObject) {
        
        // 1.退出键盘
        textView.resignFirstResponder()
        
        
        // 2.修改 collectionView 的高度
        collectionViewHeightConstraint.constant = UIScreen.mainScreen().bounds.height * 0.65
        UIView.animateWithDuration(0.5) { 
            self.view.layoutIfNeeded()
        }
        
        
        
        
        
    }
    
}



// 执行 通知 的事件响应
extension ComposeViewController {
    
   @objc private func addPhotosClick() {
        
       // 调用相册
    // 1.判断 数据源 是否可用
    if !UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
        return
    }
    
    
    // 2.创建照片 控制器
    let pic = UIImagePickerController()
    
    
    // 3.设置 照片来源
    pic.sourceType = .PhotoLibrary
    
    
    
    // 4.设置代理
    pic.delegate = self
    
    
    // 5.弹出 控制器
    presentViewController(pic, animated: true, completion: nil)
    
    
    
    
        
        
    }
    
    
    // 删除 图片
    @objc private func removePhotosClick(note : NSNotification) {
        
        
        // 1. 校验 -- 并且 获取 image图片
        guard let image = note.object as? UIImage else {
            
            
            return
        }
        
        // 2.获取 图片所在的下标
        guard let indexs = imageArray.indexOf(image) else {
            
            return
        }
        
        
        // 3.从数组中删除
        imageArray.removeAtIndex(indexs)
        
        // 4.重新给 数组赋值
        picPickerView.images = imageArray
        
        
        
        
    }
    
    
    
    
}



// 照片选择控制器的代理方法
extension ComposeViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // 1. 打印
        print(info)
        
        
        // 1. 获取图片
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        // 2. 将选中的图片添加到数组中
        imageArray.append(image)
        
        
        // 3. 将图片 交给 collectionView 显示  ------- 给 picPickerView中的数组 赋值
        picPickerView.images = imageArray
        
        
        // 4. 返回 图片选择控制器
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        
        textView.resignFirstResponder()
        
        
        
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






