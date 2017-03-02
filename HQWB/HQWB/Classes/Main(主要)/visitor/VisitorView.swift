//
//  VisitorView.swift
//  HQWB
//
//  Created by Jerry_hqyj on 17/3/2.
//  Copyright © 2017年 Jerry_hqyj. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    
    // 对 访客视图操作
    // 快速加载 xib  - 类
    class func setUpVisitorView() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }
    
    
    

}
