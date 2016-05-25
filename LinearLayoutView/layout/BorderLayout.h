
/*
 *边框布局模式，这种模式下，整个布局分为上，下，左，中，右 这五种区域，每个区域最多只能有一个视图，如果一个一个区域放了多个视图，那么只有最后一个添加的有效，其余都会被移除父视图，如果给的舞台的太小的话，本视图采用的优先级别为中，左，右,上，下
 */
#import <Foundation/Foundation.h>
#import "BorderLayoutProtocol.h"
@interface BorderLayout : NSObject <BorderLayoutProtocol>

@end
