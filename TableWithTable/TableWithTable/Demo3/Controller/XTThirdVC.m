//
//  XTThirdVC.m
//  TableWithTable
//
//  Created by 肖霆 on 16/6/18.
//  Copyright © 2016年 XTShow. All rights reserved.
//


#import "XTThirdVC.h"
#import "XTThirdLeftTableView.h"
#import "XTThirdRightCollectionView.h"

@interface XTThirdVC ()<UICollectionViewDelegate,UITableViewDelegate>

@property (nonatomic,strong) XTThirdLeftTableView *leftView;
@property (nonatomic,strong) XTThirdRightCollectionView *rightView;

@end

@implementation XTThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftView = [[XTThirdLeftTableView alloc] init];
    self.rightView = [[XTThirdRightCollectionView alloc] init];

    self.leftView.delegate = self;

    [self loadData];
    [self setupUI];
}

-(void)loadData{
    
    self.leftView.dataArray = self.leftDataArray;

    //rightView默认展示第一组数据
    self.rightView.dataArray = self.rightDataArray[0];
    self.rightView.imageNameArray = self.rightImageNameArray[0];
    
    self.rightView.colOfItem = self.colOfItem;

    self.rightView.itemSize = self.rightItemSize;
    self.rightView.minimumInteritemSpacing = self.rightViewMinimumInteritemSpacing;
    self.rightView.minimumLineSpacing = self.rightViewMinimumLineSpacing;
    self.rightView.edgeInsets = self.rightViewEdgeInsets;
}
-(void)setupUI{
    self.edgesForExtendedLayout = UIRectEdgeNone;
   
    //给左右两个tableView设置Frame(默认情况下：leftView宽度为屏幕的1/3，rightView宽度为屏幕的2/3，高度都为全屏)
    if (CGRectIsEmpty(self.leftFrame)) {
        self.leftView.frame = CGRectMake(0, 0, kScreenWidth/3, kTableViewMaxH);
    }else{
        self.leftView.frame = self.leftFrame;
    }
    
    if (CGRectIsEmpty(self.rightFrame)) {
        self.rightView.frame = CGRectMake(kScreenWidth/3, 0, kScreenWidth/3 * 2, kTableViewMaxH);
    }else{
        self.rightView.frame = self.rightFrame;
    }
    
    //leftTableView默认选中第一行
    [self.leftView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.rightView];
}

#pragma mark -
#pragma mark tableView的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.rightView.dataArray = self.rightDataArray[indexPath.row];
    self.rightView.imageNameArray = self.rightImageNameArray[indexPath.row];
    [self.rightView reloadData];
    [self.rightView setContentOffset:CGPointMake(0,0) animated:NO];

}

#pragma mark -
#pragma mark 补全cell分割线前的缝隙的方法
-(void)viewDidLayoutSubviews {
    
    if ([self.leftView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.leftView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.leftView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.leftView setLayoutMargins:UIEdgeInsetsZero];
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
