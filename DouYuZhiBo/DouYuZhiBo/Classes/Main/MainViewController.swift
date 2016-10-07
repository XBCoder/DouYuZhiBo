//
//  MainViewController.swift
//  DouYuZhiBo
//
//  Created by 肖湘波 on 16/10/6.
//  Copyright © 2016年 肖湘波. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()


         addChildVc("Home")
         addChildVc("Live")
         addChildVc("Follow")
         addChildVc("Profile")
        
        
        
    }

    private func addChildVc(storyBoardName :String){
        
        let childVc = UIStoryboard(name: storyBoardName, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(childVc)
    }
}
