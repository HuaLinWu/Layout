//
//  BorderLayoutProtocol.h
//  LinearLayoutView
//  边框布局

//  Created by 吴华林 on 16/5/16.
//  Copyright © 2016年 吴华林 All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayoutProtocol.h"
typedef NS_ENUM(NSInteger,BorderLayoutSite)
{
     BorderLayoutSiteLeft,//左边部分
     BorderLayoutSiteRight,//右边部分
     BorderLayoutSiteTop,//上面部分
     BorderLayoutSiteBottom,//下面部分
     BorderLayoutSiteCenter//中间部分
};
typedef NS_ENUM(NSInteger,BorderLayoutAlignment)
{
    BorderLayoutAlignmentLeft,//左对齐
    BorderLayoutAlignmentCenter,//居中对齐
    BorderLayoutAlignmentRight//右对齐
};

@protocol BorderLayoutProtocol <LayoutProtocol,LayoutSizeProtocol>
//水平间距
@property (nonatomic,assign)float hgap;
//垂直间距
@property(nonatomic,assign)float vgap;

- (void)addSubView:(id)subview layoutSite:(BorderLayoutSite)site layoutAlignment:(BorderLayoutAlignment)alignment;

@end
