//
//  HomeViewCell.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit
import SDWebImage


private let edgeMargin : CGFloat = 10
private let imageMargin : CGFloat = 10

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
    
    @IBOutlet weak var picView: PicCollectionView!
    
    @IBOutlet weak var contentLabelWithConstant: NSLayoutConstraint!
    
    
    @IBOutlet weak var picViewHeightConstant: NSLayoutConstraint!
    
    @IBOutlet weak var picViewWidthConstant: NSLayoutConstraint!
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
            
            
            
            // 9. 设置 图片展示的大小
            let picViewSize = CalculatePicViewSize(viewModel.pictureURL.count)
            
            picViewWidthConstant.constant = picViewSize.width
            picViewHeightConstant.constant = picViewSize.height
            
            
            // 10. 需要赋值
            picView.picURLS = viewModel.pictureURL
            
            
        }
        
        
        
    }
    
    
    
    
    
    /**
     返回cell的时候，系统调用
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        contentLabelWithConstant.constant = UIScreen.mainScreen().bounds.width - 2 * edgeMargin
        
        
        // MARK: - 拿到 collectionView的layout
        let layout = picView.collectionViewLayout as! UICollectionViewFlowLayout
        
         let  imageViewW = (UIScreen.mainScreen().bounds.width - 2 * edgeMargin - 2 * imageMargin) / 3
        // 设置item的大小
        layout.itemSize = CGSize(width: imageViewW, height: imageViewW)
        
        
    }

}


// 设置 图片展示的大小
extension HomeViewCell {
    
    private func CalculatePicViewSize(count : Int) -> CGSize {
        
        
        // 1. 没有图片
        if count == 0 {
            return CGSizeZero
        }
        
        // 取出对象的layout
        let layout = picView.collectionViewLayout as! UICollectionViewFlowLayout
        
        
        // 2. 单张图片展示
        if count == 1 {
            
            // 1.拿到下载的图片
            // 字符串
            let urlString = viewModel?.pictureURL.last?.absoluteString
            let image = SDWebImageManager.sharedManager().imageCache?.imageFromDiskCacheForKey(urlString)
            
            // 设置item的大小
            layout.itemSize = CGSize(width: (image?.size.width)! * 2, height: (image?.size.height)! * 2)
            
            
            // collectionView
            return CGSize(width: (image?.size.width)! * 2, height: (image?.size.height)! * 2)
        }
        
        
        
        // 每张图片的宽度
        let  imageViewW = (UIScreen.mainScreen().bounds.width - 2 * edgeMargin - 2 * imageMargin) / 3
        
        
        // 2. 4 张图片
        if count == 4 {
            
            let picViewHW = imageViewW * 2 + imageMargin
            
            return CGSize(width: picViewHW, height: picViewHW)
            
            
        }
    
        
        // 3. 其他
        // 3.1 行数
        let rows = CGFloat((count - 1) / 3 + 1)
        
        // 3.2 计算 picView 的高度
        let picViewH = rows * imageViewW + (rows - 1) * imageMargin
        
        // 3.3 计算 picView的宽度
        let picViewW = UIScreen.mainScreen().bounds.width - 2 * edgeMargin
       
//        print(picViewW)
        
        return CGSize(width: picViewW, height: picViewH)
        
    }
    
    
}





