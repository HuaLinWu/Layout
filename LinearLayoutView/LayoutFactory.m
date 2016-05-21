//
//  LayoutFactory.m
//  LinearLayoutView
//
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/5/17.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "LayoutFactory.h"
@implementation LayoutFactory
@synthesize layoutObject;
+(instancetype)shareFactory
{
    static LayoutFactory *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[LayoutFactory alloc] init];
    });
    return factory;
}
- (void)layoutSubviewsWithLayout:(id<LayoutProtocol>)layout layoutItems:(NSArray *)items constrainedSize:(CGSize)size
{
    if([layout.layoutObject respondsToSelector:@selector(layoutSubviewsWithLayout:layoutItems:constrainedSize:)])
    {
        id <LayoutImplementProtocol> tempLayoutImaplement = (id <LayoutImplementProtocol> )layout.layoutObject;
        [tempLayoutImaplement layoutSubviewsWithLayout:layout layoutItems:items constrainedSize:size];
    }
}
@end
