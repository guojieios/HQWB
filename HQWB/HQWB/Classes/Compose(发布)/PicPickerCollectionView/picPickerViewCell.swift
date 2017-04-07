//
//  picPickerViewCell.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/4/6.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class picPickerViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imageButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var removePhotoBtn: UIButton!
    // 定义属性
    var image : UIImage? {
        
        didSet {
            
            if image != nil {
                
                imageView.image = image
                
                imageButton.setBackgroundImage(image, forState: .Normal)
                imageButton.userInteractionEnabled = false
                removePhotoBtn.hidden = false
                
            } else {
                
                imageView.image = nil
                imageButton.setBackgroundImage(UIImage(named: "compose_pic_add"), forState: .Normal)
                 imageButton.userInteractionEnabled = true
                
                removePhotoBtn.hidden = true
                
            }
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    @IBAction func addPhotoClick(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(PicPickerAddPhotoNote, object: nil)
        
        
    }
    
    
    // 删除 button 的点击事件
    @IBAction func removePhotoClick(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(PicPickerRemovPhotoNote, object: imageView.image)
        
        
    }
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
        
        
    }

}
