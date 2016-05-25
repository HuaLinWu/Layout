//
//  LayoutFactory.h
//  LinearLayoutView
//
//  Created by 吴华林 on 16/5/17.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayoutProtocol.h"
@interface LayoutFactory : NSObject<LayoutImplementProtocol>
+(instancetype)shareFactory;
@end
