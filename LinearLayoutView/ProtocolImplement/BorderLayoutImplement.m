//
//  BorderLayoutImplement.m
//  LinearLayoutView
//
//  Created by 吴华林 on 16/5/24.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "BorderLayoutImplement.h"
#import <objc/runtime.h>
#import "BorderLayoutProtocol.h"
@interface BorderLayoutImplement()
{
    UIView *topView;
    UIView *bottomView;
    UIView *leftView;
    UIView *centerView;
    UIView *rightView;
}

@end
@implementation BorderLayoutImplement
- (void)layoutSubviewsWithLayout:(id<LayoutProtocol,LayoutSizeProtocol>)layout layoutItems:(NSArray *)items constrainedSize:(CGSize)size
{
    float vgap = ((id<BorderLayoutProtocol>) layout).vgap;
    float hgap = ((id<BorderLayoutProtocol>) layout).hgap;
    
    centerView = objc_getAssociatedObject(layout, borderLayoutSiteCenterKey);
    if(centerView)
    {
        BorderLayoutAlignment centerAlignment = (BorderLayoutAlignment) [objc_getAssociatedObject(centerView, borderLayoutAlignmentKey) integerValue];
        [self layoutViewWithSite:BorderLayoutSiteCenter layoutAlignment:centerAlignment  constrainedSize:size vgap:vgap hgap:hgap];
    }
    
    leftView   = (UIView *)objc_getAssociatedObject(layout, borderLayoutSiteLeftKey);
    if(leftView)
    {
        BorderLayoutAlignment leftAlignment = (BorderLayoutAlignment)[ objc_getAssociatedObject(leftView, borderLayoutAlignmentKey) integerValue];
        [self layoutViewWithSite:BorderLayoutSiteLeft layoutAlignment:leftAlignment  constrainedSize:size vgap:vgap hgap:hgap];
    }
    
    rightView  = objc_getAssociatedObject(layout, borderLayoutSiteRightKey);
    if(rightView)
    {
        BorderLayoutAlignment rightAlignment = (BorderLayoutAlignment)[ objc_getAssociatedObject(rightView, borderLayoutAlignmentKey) integerValue];
        [self layoutViewWithSite:BorderLayoutSiteRight layoutAlignment:rightAlignment  constrainedSize:size vgap:vgap hgap:hgap];
    }

    
    topView    = objc_getAssociatedObject(layout, borderLayoutSiteTopKey);
    if(topView)
    {
        BorderLayoutAlignment topAlignment = (BorderLayoutAlignment)[objc_getAssociatedObject(topView, borderLayoutAlignmentKey) integerValue];
        [self layoutViewWithSite:BorderLayoutSiteTop layoutAlignment:topAlignment constrainedSize:size vgap:vgap hgap:hgap];
    }
    
    bottomView = objc_getAssociatedObject(layout, borderLayoutSiteBottomKey);
    if(bottomView)
    {
        BorderLayoutAlignment bottomAlignment = (BorderLayoutAlignment)[objc_getAssociatedObject(bottomView, borderLayoutAlignmentKey) integerValue];
        [self layoutViewWithSite:BorderLayoutSiteBottom layoutAlignment:bottomAlignment constrainedSize:size vgap:vgap hgap:hgap];
    }
       for(UIView *subView in items)
    {
        if(![subView isEqual:leftView]&&![subView isEqual:rightView]&&![subView isEqual:topView]&&![subView isEqual:bottomView]&&![subView isEqual:centerView])
        {
            subView.frame = CGRectZero;
            [subView removeFromSuperview];
        }
    }
    
}


- (void)layoutViewWithSite:(BorderLayoutSite)site layoutAlignment:(BorderLayoutAlignment)alignment constrainedSize:(CGSize)size vgap:(float)vgap hgap:(float)hgap
{
    switch (site) {
        case BorderLayoutSiteLeft:
        {
            float width  = CGRectGetWidth(leftView.frame);
            float height = CGRectGetHeight(leftView.frame);
            CGRect rect = leftView.frame;
            rect.size.width = MAX(0,MIN(size.width-centerView.frame.size.width-centerView.frame.origin.x-(centerView?hgap:0)-2*hgap, width));
            rect.size.height = MAX(0,MIN(height, size.height-2*vgap));
            rect.origin.x = vgap;
            rect.origin.y = (size.height - rect.size.height)/2;
            leftView.frame = rect;
            break;
        }
        case BorderLayoutSiteRight:
        {
            float width  = CGRectGetWidth(rightView.frame);
            float height = CGRectGetHeight(rightView.frame);
            CGRect rect = rightView.frame;
            if(centerView)
            {
               rect.size.width = MAX(0,MIN(size.width-centerView.frame.size.width-centerView.frame.origin.x-3*hgap, width));
            }
            else if (leftView)
            {
                rect.size.width = MAX(0,MIN(size.width-leftView.frame.origin.x-leftView.frame.size.width-3*hgap, width));
            }
            else
            {
                rect.size.width = MAX(0,MIN(width, size.width-2*hgap));
            }
            rect.size.height = MAX(0,MIN(height, size.height-2*vgap));
            rect.origin.x = size.width-hgap-rect.size.width;
            rect.origin.y = (size.height - rect.size.height)/2;
            rightView.frame = rect;
            break;
        }
        case BorderLayoutSiteTop:
        {
            UIView *maxHeightView = [self maxHeightView:[self maxHeightView:leftView view2:centerView] view2:rightView];
            float width  = CGRectGetWidth(topView.frame);
            float height = CGRectGetHeight(topView.frame);
            CGRect rect = topView.frame;
            rect.size.height =MAX(0,  MIN(size.height - maxHeightView.frame.origin.y-maxHeightView.frame.size.height-(maxHeightView?3*vgap:2*vgap), height));
            rect.size.width = MAX(0,MIN(width, size.width-2*hgap));
            rect.origin.y = vgap;
            if(alignment == BorderLayoutAlignmentLeft)
            {
                rect.origin.x = hgap;
            }
            else if (alignment == BorderLayoutAlignmentCenter)
            {
                rect.origin.x = (size.width - rect.size.width)/2;
            }
            else if (alignment == BorderLayoutAlignmentRight)
            {
                rect.origin.x = size.width-rect.size.width-hgap;
            }
            topView.frame = rect;
            break;
        }
        case BorderLayoutSiteBottom:
        {
            UIView *maxHeightView = [self maxHeightView:[self maxHeightView:leftView view2:centerView] view2:rightView];
            float width  = CGRectGetWidth(bottomView.frame);
            float height = CGRectGetHeight(bottomView.frame);
            CGRect rect = bottomView.frame;
            rect.size.height = MAX(0,MIN(size.height - maxHeightView.frame.origin.y-maxHeightView.frame.size.height-(maxHeightView?3*vgap:2*vgap), height));
            rect.size.width =MAX(0, MIN(width, size.width-2*hgap));
            rect.origin.y = size.height - vgap-rect.size.height;
            if(alignment == BorderLayoutAlignmentLeft)
            {
                rect.origin.x = hgap;
            }
            else if (alignment == BorderLayoutAlignmentCenter)
            {
                rect.origin.x = (size.width - rect.size.width)/2;
            }
            else if (alignment == BorderLayoutAlignmentRight)
            {
                rect.origin.x = size.width-rect.size.width-hgap;
            }
            bottomView.frame = rect;
            break;
        }
        case BorderLayoutSiteCenter:
        {
            float width  = CGRectGetWidth(centerView.frame);
            float height = CGRectGetHeight(centerView.frame);
            CGRect rect = centerView.frame;
            rect.size.width =  MAX(0,MIN(size.width-2*hgap, width));
            rect.size.height = MAX(0,MIN(size.height-2*vgap, height));
            rect.origin.x = (size.width-rect.size.width)/2;
            rect.origin.y = (size.height - rect.size.height)/2;
            centerView.frame = rect;
            break;
        }
    }
}

#pragma mark 找出最高的视图
-(UIView *)maxHeightView:(UIView *)view1 view2:(UIView *)view2
{
    return view1.frame.size.height>view2.frame.size.height?view1:view2;
}
@end
