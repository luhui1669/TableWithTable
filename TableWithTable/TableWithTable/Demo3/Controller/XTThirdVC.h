//
//  XTThirdVC.h
//  TableWithTable
//
//  Created by 肖霆 on 16/6/18.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTThirdVC : UIViewController

/**leftView的frame*/
@property (nonatomic,assign) CGRect leftFrame;
/**rightView的frame*/
@property (nonatomic,assign) CGRect rightFrame;


/**leftView的数据数组*/
@property (nonatomic,strong)NSArray *leftDataArray;
/**rightView的item标题数组（元素为数组）*/
@property (nonatomic,strong)NSArray *rightDataArray;
/**rightView的item图片名称数组*/
@property (nonatomic,strong)NSArray *rightImageNameArray;


/**rightView的item的列数*/
@property (nonatomic,assign) int colOfItem;


/**rightView的item的size*/
@property (nonatomic,assign) CGSize rightItemSize;
/**rightView的最小行间距*/
@property (nonatomic,assign) CGFloat rightViewMinimumLineSpacing;
/**rightView的item间的最小距离*/
@property (nonatomic,assign) CGFloat rightViewMinimumInteritemSpacing;
/**rightView的内边距*/
@property (nonatomic,assign) UIEdgeInsets rightViewEdgeInsets;

@end
