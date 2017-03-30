//
//  HomeViewController.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/2/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit
import SDWebImage
import MJRefresh

class HomeViewController: BaseController {
    
    
    // 创建数组 存取 模型
    private lazy var viewModels : [StatuesViewModel] = [StatuesViewModel]()
    
    
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
        

        
        
        // 设置cell的高度自适应
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        // 设置 cell的预设高度
        tableView.estimatedRowHeight = 200
        
        // 调用刷新
        setUpHeaderView()
        
        
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
    
        
        
        // 设置 刷新
        private func setUpHeaderView() {
            
            // 1. 创建一个headerView
            let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "loadNewStatues")
            
            
            // 2. 设置属性
            header.setTitle("下拉刷新", forState: .Idle)
            header.setTitle("释放更新", forState: .Pulling)
            header.setTitle("加载中……", forState: .Refreshing)
            
            
            // 3. tableView 设置 header
            tableView.mj_header = header
            
            
            // 4. 进入刷新状态
            tableView.mj_header.beginRefreshing()
            
            
            
            
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
    
    
    
    @objc private func loadNewStatues() {
        
        loadStatues(true)
        
    }
    
    // 加载数据
    private func loadStatues(isNewDate : Bool) {
        
        // 需要加载新的数据
        
        // 获取到 since_id
        var since_id = 0
        if isNewDate {
            
            since_id = viewModels.first?.statues?.mid ?? 0
            
        }
        
        
        
        
        NetworkTools.ShareInstance.loadStatues(since_id) { (result, error) in
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
            var tempViewModel = [StatuesViewModel]()
            for StatuesDict in resultArray {
                // 取出的字典转成模型数据
                let Statues = StatuesModel(dict: StatuesDict)
                
                let viewModel = StatuesViewModel(status: Statues)
                
                // 添加到数组中去 -- 自定的
                tempViewModel.append(viewModel)
                
                
                
            }
            
            
            // 4. 拼接 原数据与新数据
            self.viewModels = tempViewModel + self.viewModels
            
            
            // 下载图片 - 缓存图片
            self.cachesImage(self.viewModels)
            
            
            
            
        }
        
        
    }
    
    
    
    private func cachesImage(viewModels : [StatuesViewModel]) {
        
        // 添加 多线程组
        let group = dispatch_group_create()
        
        
        
        // 1.遍历 数组模型
        for viewModel in viewModels {
            
            // 图片链接
            for picURL in viewModel.pictureURL {
                
                
                
                //  加入到 组
                dispatch_group_enter(group)
                // 缓存图片
                SDWebImageManager.sharedManager().imageDownloader?.downloadImageWithURL(picURL, options: [], progress: nil, completed: { (_, _, _, _) in
                    
                    
                    print("下载了一张图片")
                    
                    
                    // 离开 组
                    dispatch_group_leave(group)
                    
                })
                
                
                
            }
            
            
        }
        
        
        
        // 4.刷新数据
        
        // 通知 数据刷新
        
        dispatch_group_notify(group, dispatch_get_main_queue()) {
            
            self.tableView.reloadData()
            print("刷新数据")
            
            self.tableView.mj_header.endRefreshing()
            
            
            //            print(self.Statues)
        }
        
        
  

        }
            
            
    
    
    
}


// 数据源方法

extension HomeViewController {
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModels.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // cell
        // 1. 创建cell
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeCell") as! HomeViewCell
        
        
        // 2. cell设置数据
        //        let viewModel = viewModels[indexPath.row]
        
        
        // 给 cell的viewModel 属性 赋值
        //        cell.viewModel = viewModel
        cell.viewModel = viewModels[indexPath.row]
        
        
        
        return cell
        
        
        
        
    }
    
    
}

