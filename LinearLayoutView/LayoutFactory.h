//
//  LayoutFactory.h
//  LinearLayoutView
//
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/5/17.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayoutImplementProtocol.h"
@interface LayoutFactory : NSObject<LayoutImplementProtocol>
+(instancetype)shareFactory;
@end
