//
//  FlowLayoutImplement.h
//  LinearLayoutView
//
//  Created by 吴华林 on 16/5/17.
//  Copyright © 2016年 吴华林 All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayoutImplement.h"
@interface FlowLayoutImplement : LayoutImplement
-(CGSize)sizeWithLayout:(id<LayoutProtocol,LayoutSizeProtocol>)layout layoutItems:(NSArray *)items constrainedSize:(CGSize)_constrainedSize;
@end
