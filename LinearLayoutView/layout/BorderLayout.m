//
//  BorderLayout.m
//  LinearLayoutView
//
//  Created by 吴华林 on 16/5/24.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "BorderLayout.h"
#import "BorderLayoutImplement.h"
#import  <objc/runtime.h>
@implementation BorderLayout
@synthesize constrainedSize,hgap,vgap;
- (id<LayoutProtocol,LayoutSizeProtocol>)layoutObject
{
    return [BorderLayoutImplement shareLayoutImplement];
}

- (void)addSubView:(id)subview layoutSite:(BorderLayoutSite)site layoutAlignment:(BorderLayoutAlignment)alignment
{
    
    objc_setAssociatedObject(subview, borderLayoutAlignmentKey, [NSNumber numberWithInteger:alignment], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    switch (site ) {
        case BorderLayoutSiteLeft:
        {
            objc_setAssociatedObject(self, borderLayoutSiteLeftKey, subview, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            break;
        }
        case BorderLayoutSiteRight:
        {
            objc_setAssociatedObject(self, borderLayoutSiteRightKey, subview, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            break;
        }
        case BorderLayoutSiteTop:
        {
            objc_setAssociatedObject(self, borderLayoutSiteTopKey, subview, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            break;
        }
        case BorderLayoutSiteBottom:
        {
             objc_setAssociatedObject(self, borderLayoutSiteBottomKey, subview, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            break;
        }
        case BorderLayoutSiteCenter:
        {
            objc_setAssociatedObject(self, borderLayoutSiteCenterKey, subview, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            break;
        }
    }
}
@end
