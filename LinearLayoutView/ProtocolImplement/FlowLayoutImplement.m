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
@property(nonatomic,assign)float line;//当前控件所在的行
@property(nonatomic,assign)float column;//当前控件所在的列
@property(nonatomic,weak)UIView *view;
@end

@implementation FlowLayoutItem

@end
@interface FlowLayoutImplement ()
@property(nonatomic,assign)CGSize fitSize;
@property(nonatomic,strong)NSMutableArray *flowLayoutItems;
@end
@implementation FlowLayoutImplement
- (void)layoutSubviewsWithLayout:(id<LayoutProtocol,LayoutSizeProtocol>)layout layoutItems:(NSArray *)items constrainedSize:(CGSize)size
{
   [self sizeWithLayout:layout layoutItems:items constrainedSize:size];
    for( int i=0;i<self.flowLayoutItems.count;i++)
    {
        FlowLayoutItem *item = self.flowLayoutItems[i];
        item.view.frame = CGRectMake(item.x, item.y, item.width, item.height);
    }
}
#pragma mark 实现左对齐，如果横向无法放入的时候，将会换行显示，如果纵向高度也不够将会控件的宽高都至为0
- (CGSize)layoutAlignmentLeftWithConstrainedToSize:(CGSize)size layoutItems:(NSArray *)layoutItems vgap:(float)vgap hgap:(float)hgap
{
   [self.flowLayoutItems removeAllObjects];
    CGSize fitSize = CGSizeZero;
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
            item.line = line;
            item.column = column;
            lineMaxHeight = MAX(lineMaxHeight, height);
            sumColumnWidth = sumColumnWidth+width;
            column ++;
            fitSize.width = MAX(fitSize.width, sumColumnWidth+(column+1)*hgap);
            fitSize.height = MAX(fitSize.height , (sumLineHeight+(line+1)*vgap+lineMaxHeight));
        }
        else
        {
            //表示垂直放不下的时候
            item.width=0;
            item.height =0;
            item.line = line;
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
    self.fitSize = fitSize;
    return fitSize;
}
#pragma mark 实现右对齐，如果横向无法放入的时候，将会换行显示，如果纵向高度也不够将会控件的宽高都至为0
- (CGSize)layoutAlignmentRightWithConstrainedToSize:(CGSize)size layoutItems:(NSArray *)layoutItems vgap:(float)vgap hgap:(float)hgap
{
    [self.flowLayoutItems removeAllObjects];
    CGSize fitSize = CGSizeZero;
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
            item.line = line;
            item.column = column;
            lineMaxHeight = MAX(lineMaxHeight, height);
            sumColumnWidth = sumColumnWidth+width;
            column ++;
            fitSize.width = MAX(fitSize.width, sumColumnWidth+(column+1)*hgap);
            fitSize.height = MAX(fitSize.height , (sumLineHeight+(line+1)*vgap+lineMaxHeight));
            
        }
        else
        {
            //表示垂直放不下的时候
            item.width=0;
            item.height =0;
            item.line = line;
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
    self.fitSize = fitSize;
    return fitSize;
}
#pragma mark 实现居中对齐 
- (CGSize)layoutAlignmentCenterWithConstrainedToSize:(CGSize)size layoutItems:(NSArray *)layoutItems vgap:(float)vgap hgap:(float)hgap
{
    [self.flowLayoutItems removeAllObjects];
    CGSize fitSize = CGSizeZero;
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
            item.y = (line+1)*vgap+sumLineHeight;
            item.width  = width;
            item.height = height;
            item.line = line;
            item.column = column;
            lineMaxHeight = MAX(lineMaxHeight, height);
            sumColumnWidth = sumColumnWidth+width;
            column ++;
            fitSize.width = MAX(fitSize.width, sumColumnWidth+(column+1)*hgap);
            fitSize.height = MAX(fitSize.height , (sumLineHeight+(line+2)*vgap+lineMaxHeight));
        }
        else
        {
            //表示垂直放不下的时候
            item.width=0;
            item.height =0;
            item.line = line;
        }
        [self.flowLayoutItems addObject:item];
        
        for(int index =0; index<self.flowLayoutItems.count;index++)
        {
            FlowLayoutItem *item = self.flowLayoutItems[index];
            if(item.line==line&&item.column==0)
            {
                //表示这个第一个
                item.x = (size.width-(sumColumnWidth+(column+1)*hgap))/2;
                
            }
            else if (item.line==line)
            {
                FlowLayoutItem *lastItem = ((FlowLayoutItem *)self.flowLayoutItems[index-1]);
                item.x = lastItem.x+hgap+lastItem.width;
            }
        }
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
    self.fitSize = fitSize;
    return fitSize;
}
-(CGSize)sizeWithLayout:(id<LayoutProtocol,LayoutSizeProtocol>)layout layoutItems:(NSArray *)items constrainedSize:(CGSize)_constrainedSize
{
    if(CGSizeEqualToSize(self.fitSize , CGSizeZero))
    {
    id<FlowLayoutProtocol>tempLayout = (id <FlowLayoutProtocol>)layout;
    float vgap = tempLayout.vgap;
    float hgap = tempLayout.hgap;
    switch (tempLayout.align)
    {
        case FlowLayoutAlignmentRight:
        {
          return [self layoutAlignmentRightWithConstrainedToSize:_constrainedSize layoutItems:items vgap:vgap hgap:hgap];
        }
        case FlowLayoutAlignmentCenter:
        {
            return [self layoutAlignmentCenterWithConstrainedToSize:_constrainedSize layoutItems:items vgap:vgap hgap:hgap];
        }
        default:
        {
            return [self layoutAlignmentLeftWithConstrainedToSize:_constrainedSize layoutItems:items vgap:vgap hgap:hgap];
        }
    }
    }
    return self.fitSize;
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
