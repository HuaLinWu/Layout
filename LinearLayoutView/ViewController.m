//
//  ViewController.m
//  LinearLayoutView
//
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/5/16.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "ViewController.h"
#import "LayoutView.h"
#import "FlowLayout.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LayoutView *linearLayoutView = [[LayoutView alloc] initWithFrame:CGRectMake(50, 100, 195, 510)];
    [linearLayoutView setBackgroundColor: [UIColor grayColor]];
    FlowLayout *flowLayout = [[FlowLayout alloc] init];
    flowLayout.vgap = 10;
    flowLayout.hgap = 5;
    flowLayout.align = FlowLayoutAlignmentLeft;
    linearLayoutView.layoutObject =  flowLayout;
    //放入标签
    for(int i=0;i<20;i++)
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
        [linearLayoutView addSubview:label];
    }
    
    [self.view addSubview:linearLayoutView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
