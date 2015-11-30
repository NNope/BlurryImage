//
//  ViewController.h
//  BlurryImage
//
//  Created by 谈Xx on 15/8/24.
//  Copyright (c) 2015年 谈Xx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView  *myTable;
/**
 *  table的headerView
 */
@property (nonatomic, strong) UIView *myheaderView;
/**
 *  原始ImgView
 */
@property (nonatomic, strong) UIImageView  *myImgView;
/**
 *  模糊ImgView
 */
@property (nonatomic, strong) UIImageView  *blurryImgView;
/**
 *  头部的图片
 */
@property (nonatomic, strong) UIImage  *headImg;




@end

