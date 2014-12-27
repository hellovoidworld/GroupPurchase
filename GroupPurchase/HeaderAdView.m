//
//  HeaderAdView.m
//  GroupPurchase
//
//  Created by hellovoidworld on 14/12/3.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "HeaderAdView.h"

#define AD_VIEW_WIDTH 300
#define AD_VIEW_HEIGHT 120

// 遵守UIScrollViewDelegate监控滚动事件
@interface HeaderAdView() <UIScrollViewDelegate>

/** scrollView控件 */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

/** 页码 */
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

/** 计时器 */
@property(nonatomic, weak) NSTimer *timer;

@end

@implementation HeaderAdView

#pragma mark - 初始化方法
// 初始化headerAdView
+ (instancetype) headerAdView {
    return [[[NSBundle mainBundle] loadNibNamed:@"HeaderAdView" owner:nil options:nil] lastObject];
}

// 当控件从nib初始化
- (void)awakeFromNib {
    self.scrollView.scrollEnabled = YES; // 开启滚动
    self.scrollView.pagingEnabled = YES; // 开启翻页模式
    self.scrollView.delegate = self;// 设置代理
}

/** 设置ads */
- (void) setAds:(NSArray *)ads {
    if (nil != ads) {
        CGFloat adImageWidth = AD_VIEW_WIDTH;
        CGFloat adImageHeight = AD_VIEW_HEIGHT;
        CGFloat adImageY = 0;
        
        for (int i=0; i<ads.count; i++) {
            // 计算当前图片的水平坐标
            CGFloat adImageX = i * adImageWidth;
            
            UIImageView *adImageView = [[UIImageView alloc] initWithFrame:CGRectMake(adImageX, adImageY, adImageWidth, adImageHeight)];
            adImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", ads[i]]];
         
            [self.scrollView addSubview:adImageView];
        }
        
        // 设置滚动范围
        self.scrollView.contentSize = CGSizeMake(ads.count * AD_VIEW_WIDTH, 0);
        
        self.pageControl.numberOfPages = ads.count; // 总页数
        self.pageControl.pageIndicatorTintColor = [UIColor blackColor]; // 其他页码颜色
        self.pageControl.currentPageIndicatorTintColor = [UIColor redColor]; // 当前页码颜色
        
        // 添加自动轮播
        [self addTimer];
    }
    
    _ads = ads;
}

#pragma mark - 滚动事件
// 滚动动作监控，当滚动超过图片的一半的时候转变页码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollViewWidth = self.scrollView.frame.size.width;
    int page = (self.scrollView.contentOffset.x + 0.5 * scrollViewWidth) / scrollViewWidth;
    self.pageControl.currentPage = page;
}

// 手动拖动广告图片轮播的时候，暂时销毁自动轮播器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
    self.timer = nil;
}

// 手动拖动结束，从新加上自动轮播器
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self addTimer];
}

// 添加计时器
- (void) addTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    // 计时器分享主线程资源
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

// 下一张图片动作
- (void) nextImage {
    int page = 0;
    // 如果是当前页码在最后一页，从新回到第一页
    if (self.pageControl.currentPage == self.ads.count - 1) {
        page = 0;
    }
    else {
        page = self.pageControl.currentPage + 1;
    }
    
    // 滚动图片，带动画效果
    [self.scrollView setContentOffset:CGPointMake(page * AD_VIEW_WIDTH, 0) animated:YES];
}




@end
