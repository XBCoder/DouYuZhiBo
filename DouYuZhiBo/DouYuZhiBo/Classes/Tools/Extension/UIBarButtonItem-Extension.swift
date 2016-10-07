//
//  UIBarButtonItem-Extension.swift
//  DouYuZhiBo
//
//  Created by 肖湘波 on 16/10/7.
//  Copyright © 2016年 肖湘波. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    class func createItem(imageName: String, highImageName: String,size: CGSize) -> UIBarButtonItem {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: highImageName), forState: .Highlighted)
        btn.frame = CGRect(origin: CGPointZero, size: size)
        return UIBarButtonItem(customView: btn)
    }
    
//    class func createItem(imageName : String, highImageName : String, size : CGSize) -> UIBarButtonItem {
//        let btn = UIButton()
//        
//        btn.setImage(UIImage(named: imageName), forState: .Normal)
//        btn.setImage(UIImage(named: highImageName), forState: .Highlighted)
//        
//        btn.frame = CGRect(origin: CGPointZero, size: size)
//        
//        return UIBarButtonItem(customView: btn)
//    }

    // = "" 表示字符串可以为空
    convenience init(imageName: String, highImageName: String = "",size: CGSize) {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        
        if highImageName != "" {
           btn.setImage(UIImage(named: highImageName), forState: .Highlighted)
        }
        
        if size == CGSizeZero{
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPointZero, size: size)
        }
        
        self.init(customView:btn)
    }
}
