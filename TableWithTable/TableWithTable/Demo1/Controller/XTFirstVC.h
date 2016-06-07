//
//  XTFirstVC.h
//  TableWithTable
//
//  Created by 肖霆 on 16/6/7.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface XTFirstVC : UIViewController

//leftView的frame
@property (nonatomic,assign) CGRect leftFrame;
//rightView的frame
@property (nonatomic,assign) CGRect rightFrame;

//leftView的数据
@property (nonatomic,strong)NSMutableArray *leftDataArray;
//rightView的数据
@property (nonatomic,strong)NSMutableArray *rightDataArray;

@end
