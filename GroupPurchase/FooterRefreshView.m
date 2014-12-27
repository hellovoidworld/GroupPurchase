//
//  FooterRefreshView.m
//  GroupPurchase
//
//  Created by hellovoidworld on 14/12/3.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "FooterRefreshView.h"

@interface FooterRefreshView()
/** 底部的“加载更多”按钮 */
@property (weak, nonatomic) IBOutlet UIButton *footerRefreshButton;

/** 加载动画图标 */
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingImage;

/** 代理 */
@property(nonatomic, weak) id<FooterRefreshViewDelegate> delegate;

/** “加载更多”按钮点击事件 */
- (IBAction)onFooterRefreshButtonClicked;


@end

@implementation FooterRefreshView

#pragma mark - 初始化

/** 初始化方法 */
+ (instancetype) footerRrefreshViewWithDelegate:(id<FooterRefreshViewDelegate>) delegate {
    FooterRefreshView *footerRefreshView = [[[NSBundle mainBundle] loadNibNamed:@"FooterRefreshView" owner:nil options:nil] lastObject];
    
    if (nil != delegate) {
        footerRefreshView.delegate = delegate;
    }
    
    return footerRefreshView;
}

// xib控件的初始化调用方法
- (void)awakeFromNib {
    self.loadingImage.hidden = YES;
}


#pragma mark - action
/** “加载更多”按钮点击事件 */
- (IBAction)onFooterRefreshButtonClicked {
    NSString *footerButtonTitle = self.footerRefreshButton.currentTitle;
    
    // 显示正在加载
    self.loadingImage.hidden = NO;
    [self.footerRefreshButton setTitle:@"拼命加载中..." forState:UIControlStateNormal];
    
    // 暂时禁止按钮事件
    self.footerRefreshButton.userInteractionEnabled = NO;
    
    // 模拟延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 通知代理发生了点击事件
        if ([self.delegate respondsToSelector:@selector(footerRefreshViewClickedFooterRefreshButton:)]) {
            [self.delegate footerRefreshViewClickedFooterRefreshButton:self];
        }
        
        // 恢复按钮状态
        self.footerRefreshButton.userInteractionEnabled = YES;
        self.loadingImage.hidden = YES;
        [self.footerRefreshButton setTitle:footerButtonTitle forState:UIControlStateNormal];
    });

}

@end
