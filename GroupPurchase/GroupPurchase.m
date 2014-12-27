//
//  GroupPurchase.m
//  GroupPurchase
//
//  Created by hellovoidworld on 14/12/3.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "GroupPurchase.h"

@implementation GroupPurchase

//初始化方法
- (instancetype) initWithDictionary:(NSDictionary *) dictionary
{
    if (self = [super init]) {
        // 使用KVC
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

+ (instancetype) groupPurchaseWithDictionary:(NSDictionary *) dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

+ (instancetype) groupPurchase {
    return [self groupPurchaseWithDictionary:nil];
}

@end
