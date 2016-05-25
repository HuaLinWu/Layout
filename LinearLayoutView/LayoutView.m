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
    //constrainedSize
    CGSize size = self.layoutObject.constrainedSize;
    //如果没有设置舞台的大小，那么默认大小是父视图的大小
    if(CGSizeEqualToSize(size, CGSizeZero))
    {
        size = self.frame.size;
    }
    [[LayoutFactory shareFactory] layoutSubviewsWithLayout:self.layoutObject layoutItems:[self subviews] constrainedSize:size];
}

@end
