//
//  PageTitleView.swift
//  DouYuZhiBo
//
//  Created by 肖湘波 on 16/10/7.
//  Copyright © 2016年 肖湘波. All rights reserved.
//

import UIKit
//MARK:- 定义常量
private let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {
    
    //MARK:- 自定义属性
    private var titles: [String]
    
    //MARK:- 懒加载属性
    private lazy var titleLabels : [UILabel] = [UILabel]()
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.scrollsToTop = false
        return scrollView
    }()
    private lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orangeColor()
        return scrollLine
        
    }()
    
    //Mark - 自定义构造函数
    init(frame: CGRect,titles:[String]) {
        self.titles = titles
      
        
        super.init(frame: frame)
        
        
        //设置界面
        setUpUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView{
    private func setUpUI(){
        //1.添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2.添加title对应的lable
        setUpTitleLables()
        
        //3.设置底线和滚动的滑块
        setUpBottomLineAndScrollLine()
    }
    
    private func setUpTitleLables(){
        
        //0.确定label的一些值
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index,title) in titles.enumerate(){
            
            //1.创建label
            let label = UILabel()
            
            //2.设置label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFontOfSize(16.0)
            label.textColor = UIColor.darkGrayColor()
            label.textAlignment = .Center
            
            //3.设置label的frame
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4.将label添加到scrollview中
            scrollView.addSubview(label)
            titleLabels.append(label)
            
        }
    }
    
    private func setUpBottomLineAndScrollLine(){
        //1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGrayColor()
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height-lineH, width: frame.size.width, height: lineH)
        addSubview(bottomLine)
        
        //2.添加scrollLine
        //2.1获取第一个label
        guard let firstLabel = titleLabels.first else{return}
        
        firstLabel.textColor = UIColor.orangeColor()
        
        //2.2设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        
    }
}