//
//  XTThirdRightCollectionView.h
//  TableWithTable
//
//  Created by 肖霆 on 16/6/18.
//  Copyright © 2016年 XTShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTThirdRightCollectionView : UICollectionView

@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)NSArray *imageNameArray;

@property (nonatomic,assign)int colOfItem;

@property (nonatomic,assign)CGSize itemSize;
@property (nonatomic,assign)CGFloat minimumLineSpacing;
@property (nonatomic,assign)CGFloat minimumInteritemSpacing;
@property (nonatomic,assign)UIEdgeInsets edgeInsets;
@end
