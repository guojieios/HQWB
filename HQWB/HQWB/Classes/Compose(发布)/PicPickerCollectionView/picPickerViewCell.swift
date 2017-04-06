//
//  picPickerViewCell.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/4/6.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class picPickerViewCell: UICollectionViewCell {

    @IBAction func addPhotoClick(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(PicPickerAddPhotoNote, object: nil)
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
        
        
    }

}
