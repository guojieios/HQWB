//
//  WelcomeViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/20.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {

    
    // 拖线的属性
    @IBOutlet weak var IconViewBottomConstrants: NSLayoutConstraint!
    
    @IBOutlet weak var IconView: UIImageView!
    
    // 系统的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 0.1 获取URL
        let profileIconString = UserAccountTools.ShareInstance.account?.userIcon
        // 空合运算符 ： 如果没有值，赋值为空“”，如果有值，赋前面的值-profileIconString
        let url = NSURL(string: profileIconString ?? "")
        
        
        
        // 0. 获取用户头像
        IconView.setImageWithURL(url!, placeholderImage: UIImage(named: "avatar_default"))
        
        
        // 1. 改变 数值
        IconViewBottomConstrants.constant = UIScreen.mainScreen().bounds.height - 200
        
        
        
        // 2. 设置动画
        // usingSpringWithDamping : 阻力系数 0~1
        // initialSpringVelocity : 初始化速度
        UIView.animateWithDuration(5.0, delay: 0.0, usingSpringWithDamping: 0.001, initialSpringVelocity: 5.0, options: [], animations: { 
            
            
            
            
            
            
            }) { (_) in
                
        }
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
