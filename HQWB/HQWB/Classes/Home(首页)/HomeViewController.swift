//
//  HomeViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/2/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class HomeViewController: BaseController {

    private lazy var titleButton : TitleButton = TitleButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 首页 不需要调用函数的
        visiterView.addRotationAnimation()
        
        // 1.没有登录 返回
        if !isLogin {
            return
        }
        
        // 2.设置导航栏内容
        setNavigationBar()
        
    }

 }

    
// 设置 UI界面
extension HomeViewController {
    
    private func setNavigationBar() {
        
        // 设置内容
//        let leftBtn = UIButton()
//        leftBtn.setImage(UIImage(named: "navigationbar_friendattention"), forState: .Normal)
//        leftBtn.setImage(UIImage(named: "navigationbar_friendattention_highlighted"), forState: .Highlighted)
//        leftBtn.sizeToFit()
        
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
//        
//        let rightBtn = UIButton()
//        rightBtn.setImage(UIImage(named: "navigationbar_pop"), forState: .Normal)
//        rightBtn.setImage(UIImage(named: "navigationbar_pop_highlighted"), forState: .Highlighted)
//        rightBtn.sizeToFit()
//        
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
//        
        
        
        // 设置标题
//        let titleButton = UIButton()
        titleButton.setTitle("gjyhy", forState: .Normal)
       
        titleButton.addTarget(self, action: "titleButtonClick", forControlEvents: .TouchUpInside)
        
        navigationItem.titleView = titleButton
        
        
        
    }
    
    
    
    
}


// 事件响应

extension HomeViewController {
    
    // 函数私有化后，没有办法调用
   @objc private func titleButtonClick() {
        // 设置图片的选中
    // 1. 设置选中状态
    titleButton.selected = !titleButton.selected
        
        print("标题按钮")
    
    // 2. 创建 控制器
    
    let popVC = PopoViewController()
    
    
    
    // 3. 设置弹出的状态
    popVC.modalPresentationStyle = .Custom
    
    
    // !! : 设置转场效果
    popVC.transitioningDelegate = self
    
    
    // 4. 跳转控制器
    presentViewController(popVC, animated: true, completion: nil)
    
        
    }
    
    
}



extension HomeViewController : UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let presentation = HQPresentationController(presentedViewController: presented, presentingViewController: presenting)
        return presentation
    }
    
    
    
}














