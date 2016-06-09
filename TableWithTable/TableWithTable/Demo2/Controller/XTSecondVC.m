//
//  XTSecondVC.m
//  TableWithTable
//
//  Created by 肖霆 on 16/6/8.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import "XTSecondVC.h"
#import "XTSecondLeftTableView.h"
#import "XTSecondRightTableView.h"
@interface XTSecondVC ()<UITableViewDelegate>

@property (nonatomic,strong)XTSecondLeftTableView *leftView;
@property (nonatomic,strong)XTSecondRightTableView *rightView;

@end

@implementation XTSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.leftView = [[XTSecondLeftTableView alloc] init];
    self.rightView = [[XTSecondRightTableView alloc] init];
    
    self.leftView.delegate = self;
    
    [self setupUI];
    [self setupData];
}

-(void)setupUI{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //给左右两个tableView设置Frame(默认情况下：leftView宽度为屏幕的1/4，rightView宽度为屏幕的3/4，高度都为全屏)
    if (CGRectIsEmpty(self.leftFrame)) {
        self.leftView.frame = CGRectMake(0, 0, kScreenWidth/4, kTableViewMaxH);
    }else{
        self.leftView.frame = self.leftFrame;
    }
    
    if (CGRectIsEmpty(self.rightFrame)) {
        self.rightView.frame = CGRectMake(kScreenWidth/4, 0, kScreenWidth/4 * 3, kTableViewMaxH);
    }else{
        self.rightView.frame = self.rightFrame;
    }

    self.rightView.sectionHeaderH = 30;
    self.rightView.cellHeight = 44;
    
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.rightView];

}
-(void)setupData{
    
    self.leftView.dataArray = self.leftDataArray;
    
    self.rightView.dataArray = self.rightDataArray;
    self.rightView.sectionDataArray = self.leftDataArray;
    
    __weak typeof (self)weakSelf = self;
    [self.rightView setCurrentSectionBlock:^(NSIndexPath *index) {
        
    [weakSelf.leftView selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }];
}

#pragma mark -
#pragma mark tableView的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.leftView.isSelect = 1;
    self.rightView.leftTableView = self.leftView;
        
    [self.rightView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
        
    if (indexPath.row == self.leftView.dataArray.count - 1) {
        NSArray *array = self.rightView.dataArray.lastObject;
        
        if (self.rightView.sectionHeaderH + array.count * self.rightView.cellHeight < self.rightView.frame.size.height) {
        
            CGRect frame = CGRectZero;
            frame.size.height = self.rightView.bounds.size.height - self.rightView.sectionHeaderH -  array.count * self.rightView.cellHeight + 0.14;
            //在点击左侧最后一组后，再上拉右侧tableView，会调用右侧tableView倒数第二个组的willDisplayHeaderView，尝试许久没有解决，只能加0.14解决（为什么是0.14？我逐步试验的。。。。最后得到的范围是0.139～0.14，没继续往下试验。。。）估计这个0.14是willDisplayHeaderView中对will的判定值；
            //在逻辑上如何屏蔽掉暂时还没想出来。。。估计可以用手势动作的方法解决～可是。。。我不太会。。。哈哈哈～～～未来加强一下！

            UIView *view = [[UIView alloc]initWithFrame:frame];
            self.rightView.tableFooterView = view;
            
        }
        }
    }


@end
