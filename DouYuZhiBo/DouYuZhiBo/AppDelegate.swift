//
//  AppDelegate.swift
//  DouYuZhiBo
//
//  Created by 肖湘波 on 16/10/6.
//  Copyright © 2016年 肖湘波. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       
        //一行代码解决图片被渲染的问题
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        
        return true
    }

    

}

