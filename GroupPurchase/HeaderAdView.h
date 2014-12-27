//
//  HeaderAdView.h
//  GroupPurchase
//
//  Created by hellovoidworld on 14/12/3.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderAdView : UIView
// 广告组
@property(nonatomic, strong) NSArray *ads;

+ (instancetype) headerAdView;

@end
