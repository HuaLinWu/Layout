//
//  LinearLayoutModel.h
//  LinearLayoutView
//
//  Created by 吴华林 on 16/5/16.
//  Copyright © 2016年 吴华林 All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FlowLayoutProtocol.h"
@interface FlowLayout : NSObject<FlowLayoutProtocol>
//对齐方式
@property(nonatomic,assign)FlowLayoutAlignment align;
//水平间距
@property(nonatomic,assign)float hgap;
//垂直间距
@property(nonatomic,assign)float vgap;
@end
