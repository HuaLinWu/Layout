//
//  LayoutImplement.m
//  LinearLayoutView
//
//  Created by 吴华林 on 16/5/19.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "LayoutImplement.h"
@implementation LayoutImplement
+(instancetype)shareLayoutImplement
{
    static id  model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[[self class] alloc] init];
    });
    return model;
}
@end
