//
//  LinearLayoutView.h
//  LinearLayoutView
//  所有的想拥有布局功能的view 都必须继承这个view
//  Created by 吴华林 on 16/5/16.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayoutProtocol.h"
@interface LayoutView : UIView<LayoutProtocol>
@property(nonatomic)id<LayoutProtocol,LayoutSizeProtocol> layoutObject;
@end
