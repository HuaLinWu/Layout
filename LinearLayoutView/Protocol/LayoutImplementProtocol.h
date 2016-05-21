//
//  LayoutImplement.h
//  LinearLayoutView
//  布局实现需要遵循的协议
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/5/17.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayoutProtocol.h"
#import <UIKit/UIKit.h>
@protocol LayoutImplementProtocol <NSObject,LayoutProtocol>
@optional
//布局实现的方法
- (void)layoutSubviewsWithLayout:(id<LayoutProtocol>)layout layoutItems:(NSArray *)items constrainedSize:(CGSize)size;
@end
