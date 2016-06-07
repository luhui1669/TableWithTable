//
//  XTFirstTableView.h
//  TableWithTable
//
//  Created by 肖霆 on 16/6/7.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTFirstTableView : UITableView

@property (nonatomic,strong) NSArray *dataArray;
//是否被点击
@property (nonatomic)BOOL isSelect;

@end
