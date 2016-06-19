//
//  XTThirdLeftTableView.m
//  TableWithTable
//
//  Created by 肖霆 on 16/6/18.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import "XTThirdLeftTableView.h"
@interface XTThirdLeftTableView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation XTThirdLeftTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
    }
    return self;
}

#pragma mark -
#pragma mark tableView的数据源和代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"XTFirstTableViewCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}


@end
