//
//  HomeViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/2/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class HomeViewController: BaseController {
    
    
    // 创建数组 存取 模型
    private lazy var Statues : [StatuesModel] = [StatuesModel]()
    

    private lazy var titleButton : TitleButton = TitleButton()
    // 属性
    //  实例化 PopoverAnimator 对象 - 用到构造函数 PopoverAnimator()
    private lazy var popoverAnimator : PopoverAnimator = PopoverAnimator { (presented) -> () in
        self.titleButton.selected = presented
    }
    
    
    
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
        
        
        loadStatues()
        
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
    
    
    // !! : 设置转场效果 - 设置代理 ： 找到一个遵守协议的对象，执行代理方法
    popVC.transitioningDelegate = popoverAnimator
    
    // 4. 跳转控制器
    presentViewController(popVC, animated: true, completion: nil)
    
        
    }
    
    
}



// 请求数据
extension HomeViewController {
    
    private func loadStatues() {
        
        NetworkTools.ShareInstance.loadStatues { (result, error) in
            
            // 1. 错误校验
            if error != nil {
                
                print(error)
                return
                
            }
            
            // 2. 获取数据  -- 可选
            guard let resultArray = result else {
                
                
                return
                
            }
            
            
            // 3.字典转模型 ---- 》 获取模型对象
            for StatuesDict in resultArray {
                // 取出的字典转成模型数据
                let Statues = StatuesModel(dict: StatuesDict)
                
                
                // 添加到数组中去 -- 自定的
                self.Statues.append(Statues)
                
                
                
            }
            
            
            
            // 4.刷新数据
            self.tableView.reloadData()
            
//            print(self.Statues)
            
        }
        
        
    }
    
}


// 数据源方法

extension HomeViewController {
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.Statues.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // cell 
        // 1. 创建cell
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeCell")!
        
        
        // 2. cell设置数据
        let statue = Statues[indexPath.row]
        
        cell.textLabel?.text = statue.text
        
        
        return cell
        
        
        
        
    }
    
    
}

