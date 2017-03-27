//
//  HomeViewCell.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit


private let edgeMargin : CGFloat = 10

class HomeViewCell: UITableViewCell {
    
    // 用户头像
    @IBOutlet weak var iconView: UIImageView!
    // 认证图标
    @IBOutlet weak var verifiedView: UIImageView!
    // 用户名
    @IBOutlet weak var screenNameLabel: UILabel!
     // 发布时间
    @IBOutlet weak var timeLabel: UILabel!
    // 微博来源
    @IBOutlet weak var sourceLabel: UILabel!
    // 等级图标
    @IBOutlet weak var vipView: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    @IBOutlet weak var contentLabelWithConstant: NSLayoutConstraint!
    
    
    
    // 给控件 赋值
    // 1. 拿到 视图模型
    var viewModel : StatuesViewModel? {
        
        didSet {
            
            // 1.nil 值 校验
            guard let viewModel = viewModel else {
                
                return
            }
            
            // 2. 设置用户头像
            iconView.sd_setImageWithURL(viewModel.profileURL, placeholderImage: UIImage(named: "avatar_default_small"))
            
            // 3.设置认证图标
            verifiedView.image = viewModel.verifiedImage
            
            // 9. 等级图标
            vipView.image = viewModel.vipImage
            
            
            // 4.设置用户名
            screenNameLabel.text = viewModel.statues?.user?.screen_name
            
            // 5.设置微博发布时间
            timeLabel.text = viewModel.creatAtText
            // 6.微博来源
            sourceLabel.text = viewModel.sourceText
            
            // 7.微博正文
            contentLabel.text = viewModel.statues?.text
            
            
            
            // 8. 设置用户名颜色
            screenNameLabel.textColor = viewModel.vipImage == nil ? UIColor.blackColor() : UIColor.orangeColor()
            
            
        }
        
        
        
    }
    
    
    
    
    
    /**
     返回cell的时候，系统调用
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        contentLabelWithConstant.constant = UIScreen.mainScreen().bounds.width - 2 * edgeMargin
        
        
        
        
        
        
        
    }

}
