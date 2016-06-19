//
//  XTThirdRightCollectionView.m
//  TableWithTable
//
//  Created by 肖霆 on 16/6/18.
//  Copyright © 2016年 XTShow. All rights reserved.
//
#define kEdgeInsets UIEdgeInsetsMake(5, 5, 5, 5)
#define kMinimumLineSpacing 10
#define kMinimumInteritemSpacing 10

#import "XTThirdRightCollectionView.h"
#import "XTRightViewItem.h"

static NSString *cellID = @"cellID";

@interface XTThirdRightCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation XTThirdRightCollectionView

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithFrame:self.bounds collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        self.delegate = self;
        self.dataSource = self;
        self.showsVerticalScrollIndicator = NO;
        
        UINib *nib = [UINib nibWithNibName:@"XTRightViewItem" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellWithReuseIdentifier:cellID];
    }
    return self;
}

#pragma mark -
#pragma mark collection的数据源和代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XTRightViewItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    cell.titleLabel.text = self.dataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.imageNameArray[indexPath.row]];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //简单设置模式
    if (self.colOfItem) {
        CGFloat itemWidth = (self.bounds.size.width - kEdgeInsets.left - kEdgeInsets.right - (self.colOfItem - 1) * kMinimumInteritemSpacing)/self.colOfItem;
        CGFloat itemHeight = itemWidth;
        return CGSizeMake(itemWidth, itemHeight);
    }else if (!CGSizeEqualToSize(self.itemSize, CGSizeZero)){
    //详细设置模式
        return self.itemSize;
    }else{
    //默认为2列
        CGFloat itemWidth = (self.bounds.size.width - kEdgeInsets.left - kEdgeInsets.right - kMinimumInteritemSpacing)/2;
        CGFloat itemHeight = itemWidth;
        return CGSizeMake(itemWidth, itemHeight);
    }
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    if (!self.minimumLineSpacing) {
        return kMinimumLineSpacing;
    }
    return self.minimumLineSpacing;
    
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    if (!self.minimumInteritemSpacing) {
        return kMinimumInteritemSpacing;
    }
    return self.minimumInteritemSpacing;
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    if (UIEdgeInsetsEqualToEdgeInsets(self.edgeInsets, UIEdgeInsetsZero)){
        return kEdgeInsets;
    }
    return self.edgeInsets;
}
@end
