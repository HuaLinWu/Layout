//
//  LinearLayoutView.m
//  LinearLayoutView
//  
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/5/16.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "LayoutView.h"
#import "LayoutFactory.h"
@implementation LayoutView

-(void)layoutSubviews
{
    [super layoutSubviews];
    [[LayoutFactory shareFactory] layoutSubviewsWithLayout:self.layoutObject layoutItems:[self subviews] constrainedSize:self.frame.size];
}


@end
