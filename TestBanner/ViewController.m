//
//  ViewController.m
//  TestBanner
//
//  Created by ghm on 16/6/27.
//  Copyright © 2016年 ghm. All rights reserved.
//

#import "ViewController.h"
#import "CommonDefine.h"
#import "BannerView.h"

@interface ViewController ()

@end

const static CGFloat kBannerCellHeight = 150;

@implementation ViewController

- (void)viewDidLoad
{
    self.edgesForExtendedLayout = NO;
    
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:1];
    [array addObject:@"a"];
    [array addObject:@"b"];
    [array addObject:@"c"];
    
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, kMainScreenWidth, kBannerCellHeight -10);
    BannerView* banner = [[BannerView alloc]initWithFrame:rect content:array];
    [self.view addSubview:banner];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView* image = [[UIImageView alloc]init];
    image.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:image];
    image.image = [UIImage imageNamed:@"gg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
