//
//  LayoutProtocol.h
//  LinearLayoutView
//  需要使用布局类需要实现的协议
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/5/16.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

@protocol LayoutProtocol <NSObject>
@optional
//协议实现的对象
@property (nonatomic)id<LayoutProtocol> layoutObject;

@end
