//
//  ViewController.m
//  LinearLayoutView
//
//  Created by 吴华林 on 16/5/16.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "ViewController.h"
#import "LayoutView.h"
#import "FlowLayout.h"
#import "BorderLayout.h"
@interface ViewController ()
{
    __weak IBOutlet LayoutView *linearLayoutView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //流式布局
//    FlowLayout *flowLayout = [[FlowLayout alloc] init];
//    flowLayout.vgap = 10;
//    flowLayout.hgap = 5;
//    flowLayout.align = FlowLayoutAlignmentCenter;
//    linearLayoutView.layoutObject =  flowLayout;
//    linearLayoutView.layoutObject.constrainedSize = CGSizeMake(linearLayoutView.frame.size.width, MAXFLOAT);
    //边框布局
    BorderLayout*borderlayout = [[BorderLayout alloc] init];
    borderlayout.vgap = 10;
    borderlayout.hgap = 5;
    linearLayoutView.layoutObject = borderlayout;
    //放入标签
    for(int i=0;i<6;i++)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
        if(i%2==0)
        {
            label.frame = CGRectMake(0, 0, 120, 40);
        }
        label.text = [NSString stringWithFormat:@"标签%i",i];
        label.textAlignment =  NSTextAlignmentCenter;
        label.textColor = [UIColor redColor];
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 10;
        label.layer.borderWidth = 0.5;
        label.layer.borderColor = [UIColor greenColor].CGColor;
        [borderlayout addSubView:label layoutSite:i layoutAlignment:BorderLayoutAlignmentCenter];
        [linearLayoutView addSubview:label];
    }
    [self.view addSubview:linearLayoutView];
   
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
