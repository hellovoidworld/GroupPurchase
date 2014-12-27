//
//  GroupPurchase.h
//  GroupPurchase
//
//  Created by hellovoidworld on 14/12/3.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupPurchase : NSObject

/** 图片 */
@property(nonatomic, copy) NSString *icon;

/** 标题 */
@property(nonatomic, copy) NSString *title;

/** 已经购买人数 */
@property(nonatomic, copy) NSString *buyCount;

/** 价格 */
@property(nonatomic, copy) NSString *price;

//初始化方法
- (instancetype) initWithDictionary:(NSDictionary *) dictionary;
+ (instancetype) groupPurchaseWithDictionary:(NSDictionary *) dictionary;
+ (instancetype) groupPurchase;

@end
