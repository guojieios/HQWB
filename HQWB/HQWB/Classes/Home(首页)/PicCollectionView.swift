//
//  PicCollectionView.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/27.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class PicCollectionView: UICollectionView {

    // 定义属性
    
    var picURLS : [NSURL] = [NSURL]() {
        
        
        didSet {
            
            self.reloadData()
            
            
            
        }
        
        
    }
    
    
    
   
    // 数据源方法 设置一次
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
        // 设置数据元
        dataSource = self
        
        
        
    }
    
    

}



// collectionView 数据源方法
extension PicCollectionView : UICollectionViewDataSource {
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picURLS.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // 1. 创建cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PicCell", forIndexPath: indexPath) as! PicCollectionViewCell
        
        
        // 2. 给cell 设置值
        cell.picURL = picURLS[indexPath.item]
        
        
        return cell
    }
    
    
    
    
}




// 自定义 cell 类

class PicCollectionViewCell : UICollectionViewCell {
    
    // 定义属性 --- 赋值
    var picURL : NSURL? {
        
        didSet {
            
            guard let picURL = picURL else {
                
                
                return
            }
            
            // 图片赋值
            pictureView.sd_setImageWithURL(picURL, placeholderImage: UIImage(named: "empty_picture"))
            
        }
        
        
    }
    
    
    
    
    // 图片属性
    @IBOutlet weak var pictureView: UIImageView!
    
    
    
}







