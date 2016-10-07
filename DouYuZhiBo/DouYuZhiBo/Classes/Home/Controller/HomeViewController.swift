//
//  HomeViewController.swift
//  DouYuZhiBo
//
//  Created by 肖湘波 on 16/10/7.
//  Copyright © 2016年 肖湘波. All rights reserved.
//

import UIKit
private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    
    //MARK:- 懒加载属性
    private lazy var pageTitleView : PageTitleView = {
        
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()
    
    private lazy var pageContenView : PageContentView = {
        
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        var childVcs = [UIViewController]()
        
        for _ in 0..<4 {
        
            let vc = UIViewController()
            
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
           childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setUI()
    }

}

extension HomeViewController{
    
    private func setUI(){
        //0.不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        //1.设置导航栏
        setUpNavigationBar()
        
        //2.添加titleview
        view.addSubview(pageTitleView)
        
        //3.添加contentView 
        view.addSubview(pageContenView)
    }
    
    private func setUpNavigationBar(){
        //1.设置左边Logo
        let btn = UIButton()
        btn.setImage(UIImage(named: "logo"), forState: .Normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        
       
        
        
      // let searchItem = UIBarButtonItem.createItem("btn_search", highImageName: "btn_search_clicked", size: size)
        //        let historyItem = UIBarButtonItem.createItem("image_my_history", highImageName: "Image_my_history_click", size: size)
    
        //        let qrcodeItem = UIBarButtonItem.createItem("Image_scan", highImageName: "Image_scan_click", size: size)
        
        let size = CGSize(width: 40, height: 40)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
}