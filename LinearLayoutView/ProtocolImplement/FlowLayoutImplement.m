//
//  FlowLayoutImplement.m
//  LinearLayoutView
//
//  Created by 吴华林 on 16/5/17.
//  Copyright © 2016年 吴华林 All rights reserved.
//

#import "FlowLayoutImplement.h"
#import "FlowLayoutProtocol.h"
#import <UIKit/UIKit.h>
@interface FlowLayoutItem :NSObject
@property(nonatomic,assign)float x;
@property(nonatomic,assign)float y;
@property(nonatomic,assign)float height;
@property(nonatomic,assign)float width;
@property(nonatomic,weak)UIView *view;
@end

@implementation FlowLayoutItem

@end
@interface FlowLayoutImplement ()
@property(nonatomic,strong)NSMutableArray *flowLayoutItems;
@end
@implementation FlowLayoutImplement
- (void)layoutSubviewsWithLayout:(id<LayoutProtocol>)layout layoutItems:(NSArray *)items constrainedSize:(CGSize)size
{
    id<FlowLayoutProtocol>tempLayout = (id <FlowLayoutProtocol>)layout;
    float vgap = tempLayout.vgap;
    float hgap = tempLayout.hgap;
    switch (tempLayout.align) {
        case FlowLayoutAlignmentRight:
        {
            [self layoutAlignmentRightWithConstrainedToSize:size layoutItems:items vgap:vgap hgap:hgap];
            break;
        }
        case FlowLayoutAlignmentCenter:
        {
            
            break;
        }
        default:
        {
            [self layoutAlignmentLeftWithConstrainedToSize:size layoutItems:items vgap:vgap hgap:hgap];
            break;
        }
    }
   
    for( int i=0;i<self.flowLayoutItems.count;i++)
    {
        FlowLayoutItem *item = self.flowLayoutItems[i];
        item.view.frame = CGRectMake(item.x, item.y, item.width, item.height);
    }
}
#pragma mark 实现左对齐，如果横向无法放入的时候，将会换行显示，如果纵向高度也不够将会控件的宽高都至为0
- (void)layoutAlignmentLeftWithConstrainedToSize:(CGSize)size layoutItems:(NSArray *)layoutItems vgap:(float)vgap hgap:(float)hgap
{
   [self.flowLayoutItems removeAllObjects];
    float sumLineHeight =0;
    float sumColumnWidth = 0;
    float column  =0;
    float line =0;
    float lineMaxHeight=0;
    for(int i=0;i<layoutItems.count;i++)
    {
        FlowLayoutItem *item = [[FlowLayoutItem alloc] init];
        UIView *subView = layoutItems[i];
        item.view = subView;
        float width  = CGRectGetWidth(subView.frame);
        float height = CGRectGetHeight(subView.frame);
    paixu:if(sumColumnWidth+(column+1)*hgap+width<=size.width-hgap)
    {
        //水平可以放的下垂直放的下
        if((line+1)*vgap+sumLineHeight+height<=size.height-vgap)
        {
            item.x = sumColumnWidth+(column+1)*hgap;
            item.y = (line+1)*vgap+sumLineHeight;
            item.width  = width;
            item.height = height;
            lineMaxHeight = MAX(lineMaxHeight, height);
            sumColumnWidth = sumColumnWidth+width;
            column ++;
            
        }
        else
        {
            //表示垂直放不下的时候
            item.width=0;
            item.height =0;
        }
        [self.flowLayoutItems addObject:item];
    }
    else
    {
        //表示水平放不下
        line++;
        column =0;
        sumLineHeight = sumLineHeight+lineMaxHeight;
        sumColumnWidth = 0;
        lineMaxHeight =0;
        goto paixu;
    }
    }

  
}
#pragma mark 实现右对齐，如果横向无法放入的时候，将会换行显示，如果纵向高度也不够将会控件的宽高都至为0
- (void)layoutAlignmentRightWithConstrainedToSize:(CGSize)size layoutItems:(NSArray *)layoutItems vgap:(float)vgap hgap:(float)hgap
{
    [self.flowLayoutItems removeAllObjects];
    float sumLineHeight =0;
    float sumColumnWidth = 0;
    float column  =0;
    float line =0;
    float lineMaxHeight=0;
    for(int i=0;i<layoutItems.count;i++)
    {
        FlowLayoutItem *item = [[FlowLayoutItem alloc] init];
        UIView *subView = layoutItems[i];
        item.view = subView;
        float width  = CGRectGetWidth(subView.frame);
        float height = CGRectGetHeight(subView.frame);
    paixu:if(sumColumnWidth+(column+1)*hgap+width<=size.width-hgap)
    {
        //水平可以放的下垂直放的下
        if((line+1)*vgap+sumLineHeight+height<=size.height-vgap)
        {
            item.x = size.width-(sumColumnWidth+(column+1)*hgap)-width;
            item.y = (line+1)*vgap+sumLineHeight;
            item.width  = width;
            item.height = height;
            lineMaxHeight = MAX(lineMaxHeight, height);
            sumColumnWidth = sumColumnWidth+width;
            column ++;
            
        }
        else
        {
            //表示垂直放不下的时候
            item.width=0;
            item.height =0;
        }
        [self.flowLayoutItems addObject:item];
    }
    else
    {
        //表示水平放不下
        line++;
        column =0;
        sumLineHeight = sumLineHeight+lineMaxHeight;
        sumColumnWidth = 0;
        lineMaxHeight =0;
        goto paixu;
    }
    }
    
    
}
#pragma mark 实现居中对齐 
- (void)layoutAlignmentCenterWithConstrainedToSize:(CGSize)size layoutItems:(NSArray *)layoutItems vgap:(float)vgap hgap:(float)hgap
{
    
}
#pragma mark set/get
- (NSMutableArray *)flowLayoutItems
{
    if(!_flowLayoutItems)
    {
      _flowLayoutItems = [[NSMutableArray alloc] init];
    }
    return _flowLayoutItems;
}
@end
