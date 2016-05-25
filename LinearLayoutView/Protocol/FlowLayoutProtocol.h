//
//  FlowLayoutProtocol.h
//  LinearLayoutView
//  线型布局的协议
//  Created by 吴华林 on 16/5/16.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayoutProtocol.h"
typedef NS_ENUM(NSInteger,FlowLayoutAlignment)
{
     FlowLayoutAlignmentLeft,//左对齐
     FlowLayoutAlignmentCenter,//居中对齐
     FlowLayoutAlignmentRight//右对齐
};
@protocol FlowLayoutProtocol <LayoutProtocol,LayoutSizeProtocol>
//对齐方式
@property(nonatomic,assign)FlowLayoutAlignment align;
//水平间距
@property(nonatomic,assign)float hgap;
//垂直间距
@property(nonatomic,assign)float vgap;

-(CGSize)sizeWithLayoutItems:(NSArray *)items constrainedSize:(CGSize)_constrainedSize;
@end
