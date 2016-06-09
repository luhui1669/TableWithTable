//
//  XTSecondVC.h
//  TableWithTable
//
//  Created by 肖霆 on 16/6/8.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTSecondVC : UIViewController

/**leftView的frame*/
@property (nonatomic,assign) CGRect leftFrame;
/**rightView的frame*/
@property (nonatomic,assign) CGRect rightFrame;

/**leftView的数据数组*/
@property (nonatomic,strong)NSArray *leftDataArray;
/**rightView的组标题数据数组*/
@property (nonatomic,strong)NSArray *rightSectionDataArray;
/**rightView的数据数组（元素为数组）*/
@property (nonatomic,strong)NSArray *rightDataArray;

@end
