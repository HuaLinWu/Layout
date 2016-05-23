//
//  LinearLayoutModel.m
//  LinearLayoutView
//
//  Created by 吴华林 on 16/5/16.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "FlowLayout.h"
#import "FlowLayoutImplement.h"

@implementation FlowLayout
@synthesize constrainedSize;
- (id<LayoutProtocol,LayoutSizeProtocol>)layoutObject
{
    return [FlowLayoutImplement shareLayoutImplement];
}

@end
