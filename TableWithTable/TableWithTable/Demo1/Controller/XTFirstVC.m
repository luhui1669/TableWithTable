//
//  XTFirstVC.m
//  TableWithTable
//
//  Created by 肖霆 on 16/6/7.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import "XTFirstVC.h"
#import "XTFirstTableView.h"

@interface XTFirstVC ()<UITableViewDelegate>
@property (nonatomic,strong)XTFirstTableView *leftView;
@property (nonatomic,strong)XTFirstTableView *rightView;
@end

@implementation XTFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    self.leftView = [[XTFirstTableView alloc] init];
    self.rightView = [[XTFirstTableView alloc] init];
    
    self.leftView.delegate = self;
    self.rightView.delegate = self;
    
    
    [self setupUI];
    
}

-(void)setupUI{
    
    CGFloat width = kScreenWidth;
    CGFloat height = kScreenHeight - kNavBarHeight - kStatusBarHeight;

    //给左右两个tableView设置Frame(默认情况下：leftView宽度为屏幕的1/3，rightView宽度为屏幕的2/3，高度都为全屏)
    if (CGRectIsEmpty(self.leftFrame)) {
        self.leftView.frame = CGRectMake(0, 0, width/3, height);
    }else{
        self.leftView.frame = self.leftFrame;
    }
    
    if (CGRectIsEmpty(self.rightFrame)) {
        self.rightView.frame = CGRectMake(width/3, 0, width/3 * 2, height);
    }else{
        self.rightView.frame = self.rightFrame;
    }
    
    self.leftView.dataArray = self.leftDataArray;
    
    //leftTableView默认选中第一行
    [self.leftView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    //rightTableView默认展示第一组数据
    self.rightView.dataArray = self.rightDataArray[0];
    
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.rightView];
}

#pragma mark -
#pragma mark tableView的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftView) {
        self.rightView.dataArray = self.rightDataArray[indexPath.row];
        [self.rightView reloadData];
        [self.rightView setContentOffset:CGPointMake(0,0) animated:NO];
    }
}

#pragma mark -
#pragma mark 补全cell分割线前的缝隙的方法
-(void)viewDidLayoutSubviews {
    
    if ([self.leftView respondsToSelector:@selector(setSeparatorInset:)] || [self.rightView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.leftView setSeparatorInset:UIEdgeInsetsZero];
        [self.rightView setSeparatorInset:UIEdgeInsetsZero];
        
        
    }
    if ([self.leftView respondsToSelector:@selector(setLayoutMargins:)] || [self.rightView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.leftView setLayoutMargins:UIEdgeInsetsZero];
        [self.rightView setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

@end
