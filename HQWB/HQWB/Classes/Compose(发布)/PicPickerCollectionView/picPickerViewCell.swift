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
    
    
    // 定义属性
    var image : UIImage? {
        
        didSet {
            
            if image != nil {
                imageButton.setBackgroundImage(image, forState: .Normal)
                imageButton.userInteractionEnabled = false
                
            } else {
                
                imageButton.setBackgroundImage(UIImage(named: "compose_pic_add"), forState: .Normal)
                 imageButton.userInteractionEnabled = true
                
            }
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    @IBAction func addPhotoClick(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(PicPickerAddPhotoNote, object: nil)
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
        
        
    }

}
