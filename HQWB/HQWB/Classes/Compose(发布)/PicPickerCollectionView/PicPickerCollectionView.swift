//
//  PicPickerCollectionView.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/4/6.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

private let picPickerCell = "picPickerCell"
private let edgeMargin : CGFloat = 15


class PicPickerCollectionView: UICollectionView {

   
    // 存取 图片
    var images : [UIImage] = [UIImage]() {
        
        didSet {
            
            reloadData()
            
        }
        
        
    }
    
    
    
    
    override func awakeFromNib() {
        
        
        // 1.设置 collectionView的cell --- 布局
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        // 设置 cell 的宽高
        let itemHW = (UIScreen.mainScreen().bounds.width - 4 * edgeMargin) / 3
        layout.itemSize = CGSize(width: itemHW, height: itemHW)
        
        layout.minimumLineSpacing = edgeMargin
        layout.minimumInteritemSpacing = edgeMargin
        
        
        // 设置 内边距
        contentInset = UIEdgeInsets(top: edgeMargin, left: edgeMargin, bottom: 0, right: edgeMargin)
    
        
        
        // 注册 cell
//        registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: picPickerCell)

        
        registerNib(UINib(nibName: "picPickerViewCell", bundle: nil), forCellWithReuseIdentifier: picPickerCell)
        
        // 设置 数据源
        dataSource = self
        
        
    }
    
    
    
    

}



// 数据源方法
extension PicPickerCollectionView : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count + 1
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // 1.创建cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(picPickerCell, forIndexPath: indexPath) as! picPickerViewCell
        
        
        // 2. 设置 cell
        // cell 赋值
        cell.backgroundColor = UIColor.redColor()

        
        //
       
        cell.image = indexPath.item <= images.count - 1 ? images[indexPath.item] : nil
        
        
        
        // 3. 返回cell
        return cell
        
        
    }
    
    
    
    
    
}
