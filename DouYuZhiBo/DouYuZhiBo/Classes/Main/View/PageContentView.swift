//
//  PageContentView.swift
//  DouYuZhiBo
//
//  Created by 肖湘波 on 16/10/7.
//  Copyright © 2016年 肖湘波. All rights reserved.
//

import UIKit

private let contetenCellID = "contetenCellID"

class PageContentView: UIView {
    
    
    //MARK:- 自定义属性
    private var childVcs : [UIViewController]
    private var parentViewController : UIViewController
    
    //MARK:- 懒加载属性
    private lazy var collectionView : UICollectionView = {
        
        //1.创建layout 
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .Horizontal
    
        //2.创建UICollectionView 
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.pagingEnabled = false
        
        collectionView.bounces = false
        collectionView.dataSource = self
        
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: contetenCellID)
        
        return collectionView

        
    }()
    
    init(frame: CGRect,childVcs: [UIViewController],parentViewController: UIViewController) {
       
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        //设置UI界面
        setUpUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageContentView{
    
    private func setUpUI() {
        //1.将子控制器添加到父控制器中
        for childVC in childVcs{
            parentViewController.addChildViewController(childVC)
        }
        
        //2.添加uiconllectionview,用于在cell中存放控制器的view
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

//MARK:- 遵守UICollectionViewDataSource
extension PageContentView : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //1.创建cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(contetenCellID, forIndexPath: indexPath)
        
        //2.给cell设置内容
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}
