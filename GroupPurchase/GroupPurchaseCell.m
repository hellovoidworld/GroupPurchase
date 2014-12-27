//
//  GroupPurchaseCell.m
//  GroupPurchase
//
//  Created by hellovoidworld on 14/12/3.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "GroupPurchaseCell.h"
#import "GroupPurchase.h"

@implementation GroupPurchaseCell

// 界面被初始化的时候调用 awakeFromNib
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/** 自定初始化的类方法，传入model数据 */
+ (instancetype) groupPurchaseCellWithTableView:(UITableView *) tableView {
    
    static NSString *ID = @"groupPurchase";
    
    // 从缓存池寻找
    GroupPurchaseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 若缓存池没有，则创建一个
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GroupPurchaseCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

/** 加载Model数据，初始化界面 */
- (void) setGroupPurchase:(GroupPurchase *) groupPurchase {
    if (nil != groupPurchase) {
        self.titleLabel.text = groupPurchase.title;
        self.iconImageView.image = [UIImage imageNamed:groupPurchase.icon];
        self.priceLabel.text = [NSString stringWithFormat:@"￥%@", groupPurchase.price];
        self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已经购买", groupPurchase.buyCount];
    }
    
    _groupPurchase = groupPurchase;
}

@end
