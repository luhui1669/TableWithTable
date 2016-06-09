//
//  XTSecondRightTableView.h
//  TableWithTable
//
//  Created by 肖霆 on 16/6/8.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XTSecondLeftTableView;
@interface XTSecondRightTableView : UITableView

@property (nonatomic,strong) NSArray *sectionDataArray;
@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) XTSecondLeftTableView *leftTableView;

//原有组头高度无效，自定义一个
@property (nonatomic) CGFloat sectionHeaderH;
//原有的cell高度在使用设置cell高度时为无效（但是他妹的我没使用也是无效的啊。。。），所以自定义一个cell高度的属性
@property (nonatomic) CGFloat cellHeight;

//现在显示的第一个组的序号
@property (nonatomic,copy) void(^currentSectionBlock)(NSIndexPath *currentSection);

@end
