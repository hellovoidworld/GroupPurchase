//
//  FooterRefreshView.h
//  GroupPurchase
//
//  Created by hellovoidworld on 14/12/3.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FooterRefreshView;

// 定义delegate协议
@protocol FooterRefreshViewDelegate <NSObject>

@optional
- (void) footerRefreshViewClickedFooterRefreshButton:(FooterRefreshView *) footerRefreshView;

@end

@interface FooterRefreshView : UIView

// 带代理的初始化方法
+ (instancetype) footerRrefreshViewWithDelegate:(id<FooterRefreshViewDelegate>) delegate;

@end
