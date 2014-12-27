//
//  GroupPurchaseCell.h
//  GroupPurchase
//
//  Created by hellovoidworld on 14/12/3.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupPurchase;

// TableViewCell的class， 继承UITableViewCell
@interface GroupPurchaseCell : UITableViewCell

/** Model数据 */
@property(nonatomic, strong) GroupPurchase *groupPurchase;

/** 团购图片 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

/** 价格 */
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

/** 购买人数 */
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

/** 自定初始化的类方法，传入model数据 */
+ (instancetype) groupPurchaseCellWithTableView:(UITableView *) tableView;


@end
