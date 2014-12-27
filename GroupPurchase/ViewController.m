//
//  ViewController.m
//  GroupPurchase
//
//  Created by hellovoidworld on 14/12/3.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "ViewController.h"
#import "GroupPurchase.h"
#import "GroupPurchaseCell.h"
#import "FooterRefreshView.h"
#import "HeaderAdView.h"


@interface ViewController () <FooterRefreshViewDelegate>

@property(nonatomic, strong) NSArray *groupPurchases;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建尾部控件
    FooterRefreshView *footerView = [FooterRefreshView footerRrefreshViewWithDelegate:self];
    
    // 设置尾部控件
    self.tableView.tableFooterView = footerView;
    
    
    //设置头部广告
    HeaderAdView *adView = [self genAdView]; // 手动拼装广告图片数据
    self.tableView.tableHeaderView = adView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}


#pragma mark - 数据方法
/** 延迟数据加载到model */
- (NSArray *) groupPurchases {
    if (nil == _groupPurchases) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
        
        NSMutableArray *mdictArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            GroupPurchase *groupPurchase = [GroupPurchase groupPurchaseWithDictionary:dict];
            [mdictArray addObject:groupPurchase];
        }
        
        _groupPurchases = mdictArray;
    }
    
    return _groupPurchases;
}

/** section数 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/** 行数 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groupPurchases.count;
}

/** 内容 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
    GroupPurchaseCell *cell = [GroupPurchaseCell groupPurchaseCellWithTableView:self.tableView];

    // 2.给cell传递model数据
    cell.groupPurchase = self.groupPurchases[indexPath.row];
    
    return cell;
}

/** 行高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

/** 实现FooterRefreshViewDelegate协议 */
- (void)footerRefreshViewClickedFooterRefreshButton:(FooterRefreshView *)footerRefreshView {
    //增加团购记录
    GroupPurchase *groupPurchase = [GroupPurchase groupPurchase];
    groupPurchase.icon = @"M2Mini.jpg";
    groupPurchase.title = @"增加用例";
    groupPurchase.price = @"88";
    groupPurchase.buyCount = @"32";
    
    // 加入新数据
    NSMutableArray *marray = [NSMutableArray arrayWithArray:self.groupPurchases];
    [marray addObject:groupPurchase];
    self.groupPurchases = marray;
    
    // 刷新数据
    [self.tableView reloadData];
}

// 配置一些头部广告的数据
- (HeaderAdView *) genAdView {
    HeaderAdView *adView = [HeaderAdView headerAdView];
    
    NSMutableArray *adImages = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        [adImages addObject:[NSString stringWithFormat:@"ad_%02d", i]];
    }
    
    adView.ads = adImages;
    
    return adView;
}

@end
