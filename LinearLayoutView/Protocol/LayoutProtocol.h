//
//  LayoutProtocol.h
//  LinearLayoutView
//  需要使用布局类需要实现的协议
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/5/16.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MacroDefinition.h"
@protocol LayoutProtocol;
#pragma mark 跟布局的size 有关的协议
@protocol LayoutSizeProtocol <NSObject>
@optional
//画布的大小
@property(nonatomic)CGSize constrainedSize;
@end

#pragma mark  使用布局类需要遵循的协议
@protocol LayoutProtocol <NSObject>
@optional
//协议实现的对象
@property (nonatomic)id<LayoutProtocol,LayoutSizeProtocol> layoutObject;
@end

#pragma mark  布局实现的类需要遵循的协议
@protocol LayoutImplementProtocol <NSObject,LayoutProtocol>
@optional
//布局实现的方法
- (void)layoutSubviewsWithLayout:(id<LayoutProtocol,LayoutSizeProtocol>)layout layoutItems:(NSArray *)items constrainedSize:(CGSize)size;
@end

