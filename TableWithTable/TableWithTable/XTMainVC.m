//
//  XTMainVC.m
//  TableWithTable
//
//  Created by 肖霆 on 16/6/7.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import "XTMainVC.h"
#import "XTFirstVC.h"
@interface XTMainVC ()
//Demo1使用的全局变量
@property (nonatomic,strong)NSMutableArray *Demo1LeftDataArray;
@property (nonatomic,strong)NSMutableArray *Demo1RightDataArray;

@end

@implementation XTMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //解析数据
    [self makeDemoData];
    
    CGFloat btnWidth = 100;
    CGFloat btnHeight = 40;
    //btn1
    UIButton *btn1 = [self makeBtn:@"直接刷新" frame:CGRectMake(kScreenWidth/2 - btnWidth/2, kScreenHeight/3,btnWidth,btnHeight)];
    [btn1 addTarget:self action:@selector(pushToDemo1) forControlEvents:UIControlEventTouchUpInside];
    
    
    
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
    self.Demo1LeftDataArray = [NSMutableArray array];
    self.Demo1RightDataArray = [NSMutableArray array];
    for (NSDictionary *dic in dataArray) {
        
        [self.Demo1LeftDataArray addObject:dic[@"name"]];
        [self.Demo1RightDataArray addObject:dic[@"data"]];
    }


}

//跳转到Demo1的方法
-(void)pushToDemo1{
/*===========================对Demo1的ViewController的设置==============================*/
    XTFirstVC *vc = [[XTFirstVC alloc] init];
    vc.leftDataArray = self.Demo1LeftDataArray;
    vc.rightDataArray = self.Demo1RightDataArray;
    
    [self.navigationController pushViewController:vc animated:YES];
}



@end
