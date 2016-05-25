//
//  LayoutImplement.h
//  LinearLayoutView
//  所有布局实现的基类
//  Created by 吴华林 on 16/5/19.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayoutProtocol.h"
@interface LayoutImplement : NSObject<LayoutImplementProtocol,LayoutSizeProtocol>
+(instancetype)shareLayoutImplement;
@end
