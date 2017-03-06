//
//  PopoverAnimator.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/6.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject {

    var isPresented : Bool = false
}




// 自定义转场的代理方法
extension PopoverAnimator : UIViewControllerTransitioningDelegate {
    
    // 目的： 修改view的frame
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let presentation = HQPresentationController(presentedViewController: presented, presentingViewController: presenting)
        return presentation
    }
    
    
    // 目的： 修改转场动画出现
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = true
        
        return self
        
        
    }
    
    
    // 目的： 修改转场动画消失
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = false
        
        return self
    }
    
    
    
}


// MARK : - 自定义转场动画
extension PopoverAnimator : UIViewControllerAnimatedTransitioning {
    
    // 转场动画持续的时间
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return 0.5
    }
    
    
    // 获取到转场控制器的内容 ： 消失的view 与  弹出的view
    /*  UITransitionContextFromViewKey   获取消失的view
    UITransitionContextToViewKey     获取到弹出的view
    */
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        isPresented ? animationForPresentedView(transitionContext) : animationForDismissdView(transitionContext)
        
        
        
    }
    
    // 自定义转场动画 出现
    func animationForPresentedView(transitionContext: UIViewControllerContextTransitioning) {
        
        
        // 1.获取弹出的view
        let presentedView = transitionContext.viewForKey(UITransitionContextToViewKey)
        
        
        
        // 2. 将获取到的view 加入到 containerView里 - 容器视图里
        transitionContext.containerView()?.addSubview(presentedView!)
        
        
        // 3.执行动画
        presentedView?.transform = CGAffineTransformMakeScale(1.0, 0.0)
        // 设置锚点
        presentedView?.layer.anchorPoint = CGPointMake(0.5, 0)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            
            // 恢复到原大小
            presentedView?.transform = CGAffineTransformIdentity
            
            
            }) { (isFinish) -> Void in
                
                // 动画结束 - 告诉转场上下文 完成
                
                // 必须告诉 转场上下文 动画完成
                transitionContext.completeTransition(true)
                
        }
        
        
        
    }
    
    
    // 自定义转场动画 消失
    func animationForDismissdView(transitionContext: UIViewControllerContextTransitioning) {
        
        // 1. 获取到消失的view
        let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        
        
        // 2.执行动画
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            
            // 缩小view
            dismissView?.transform = CGAffineTransformMakeScale(1.0, 0.00001)
            
            
            }) { (isFinish) -> Void in
                
                
                // 消去视图
                dismissView?.removeFromSuperview()
                
                transitionContext.completeTransition(true)
                
                
        }
        
        
        
    }
    
    
    
    
    
    
    
    
}
