//
//  XTMainVC.m
//  TableWithTable
//
//  Created by 肖霆 on 16/6/7.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import "XTMainVC.h"
#import "XTFirstVC.h"
#import "XTSecondVC.h"
#import "XTThirdVC.h"
@interface XTMainVC ()

@property (nonatomic,strong)NSMutableArray *leftDataArray;
@property (nonatomic,strong)NSMutableArray *rightDataArray;
@property (nonatomic,strong)NSMutableArray *rightImageNameArray;


@end

@implementation XTMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //解析数据
    [self makeDemoData];
    
    CGFloat btnWidth = 250;
    CGFloat btnHeight = 40;
    //btn1
    UIButton *btn1 = [self makeBtn:@"直接刷新" frame:CGRectMake(kScreenWidth/2 - btnWidth/2, kScreenHeight/4,btnWidth,btnHeight)];
    [btn1 addTarget:self action:@selector(pushToDemo1) forControlEvents:UIControlEventTouchUpInside];
    
    //btn2
    UIButton *btn2 = [self makeBtn:@"滚动刷新" frame:CGRectMake(kScreenWidth/2 - btnWidth/2, kScreenHeight/4 * 2,btnWidth,btnHeight)];
    [btn2 addTarget:self action:@selector(pushToDemo2) forControlEvents:UIControlEventTouchUpInside];
    
    //btn2
    UIButton *btn3 = [self makeBtn:@"右侧为CollectionView形式" frame:CGRectMake(kScreenWidth/2 - btnWidth/2, kScreenHeight/4 * 3,btnWidth,btnHeight)];
    [btn3 addTarget:self action:@selector(pushToDemo3) forControlEvents:UIControlEventTouchUpInside];
    
}


//创建并添加按钮
-(UIButton *)makeBtn:(NSString *)title frame:(CGRect)frame{
    
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:randomColor];
    [self.view addSubview:btn];

    return btn;

}

//解析示例数据
-(void)makeDemoData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CommonSymptoms.plist" ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
    
    self.leftDataArray = [NSMutableArray array];
    self.rightDataArray = [NSMutableArray array];
    self.rightImageNameArray = [NSMutableArray array];
    for (NSDictionary *dic in dataArray) {
        
        [self.leftDataArray addObject:dic[@"name"]];
        [self.rightDataArray addObject:dic[@"data"]];
        [self.rightImageNameArray addObject:dic[@"imageName"]];
    }


}

//跳转到Demo1的方法
-(void)pushToDemo1{
/*===========================对Demo1的ViewController的设置==============================*/
    XTFirstVC *vc = [[XTFirstVC alloc] init];
    
    vc.leftDataArray = self.leftDataArray;
    //rightDataArray是元素为数组的数组
    vc.rightDataArray = self.rightDataArray;
    
    //可对左右两个tableView的frame进行设置，默认值为：leftView宽度为屏幕的1/3，rightView宽度为屏幕的2/3，高度都为全屏
    //vc.leftFrame = CGRectMake(0, 0, 100, 300);
    //vc.rightFrame = CGRectMake(120, 0, 100, 250);
    
    [self.navigationController pushViewController:vc animated:YES];
}

//跳转到Demo2的方法
-(void)pushToDemo2{
/*===========================对Demo2的ViewController的设置==============================*/
    XTSecondVC *vc = [[XTSecondVC alloc] init];

    vc.leftDataArray = self.leftDataArray;
    //rightDataArray是元素为数组的数组
    vc.rightDataArray = self.rightDataArray;
    vc.rightSectionDataArray = self.leftDataArray;
    
    //可对左右两个tableView的frame进行设置，默认值为：leftView宽度为屏幕的1/4，rightView宽度为屏幕的3/4，高度都为全屏
    //vc.leftFrame = CGRectMake(0, 0, 100, 300);
    //vc.rightFrame = CGRectMake(120, 0, 100, 250);
    
    [self.navigationController pushViewController:vc animated:YES];
}

//跳转到Demo3的方法
-(void)pushToDemo3{
    /*=================对Demo2的ViewController的设置====================*/
    /*========分两种设置模式：简易设置模式；详细设置模式===========*/
    XTThirdVC *vc = [[XTThirdVC alloc] init];
    vc.leftDataArray = self.leftDataArray;
    //rightDataArray是元素为数组的数组
    vc.rightDataArray = self.rightDataArray;
    vc.rightImageNameArray = self.rightImageNameArray;
    
    //两种设置模式任选其一使用，都不使用时默认为两列
    
    /*=====1.简易设置模式=====*/
    //只需设置rightView的item的列数即可
    //vc.colOfItem = 4;
    
    /*=====2.详细设置模式=====*/
    //vc.rightItemSize = CGSizeMake(70, 50);
    //vc.rightViewMinimumLineSpacing = 1;
    //vc.rightViewMinimumInteritemSpacing = 50;
    //vc.rightViewEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //可对左右两个tableView的frame进行设置，默认值为：leftView宽度为屏幕的1/3，rightView宽度为屏幕的2/3，高度都为全屏
    //vc.leftFrame = CGRectMake(0, 0, 100, 300);
    //vc.rightFrame = CGRectMake(120, 0, 100, 250);
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
