//
//  ViewController.m
//  fengzhuang
//
//  Created by 章为 on 16/6/16.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "UIView+BlocksKit.h"
#import "UIControl+ZW.h"
#import "UIGestureRecognizer+BlocksKit.h"
#import "GPSManager.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)myInit{
    self.NavigationBarHidden =YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    NSArray *array=@[@"1",@"2",@"3",@"4"];
//    [array bk_each:^(id obj) {
//       
//        NSLog(@"arr====%@",obj);
//        
//    }];
//    [array bk_apply:^(id obj) {
//        NSLog(@"arr111====%@",obj);
//    }];
    
    
   // UITapGestureRecognizer
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor=[UIColor orangeColor];
    btn.zhw_acceptEventInterval = 3;
    [btn setTitle:@"定位" forState:UIControlStateNormal];

    
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    btn.frame=CGRectMake(30, 70, 80, 80);
    btn.center=self.view.center;
    btn.tag = 90;
    [self.view addSubview:btn];
    NSRunLoop *loopCur = [NSRunLoop currentRunLoop];
    CFRunLoopRef *loop = [loopCur getCFRunLoop];
    UIImageView  *v111=[[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
    v111.backgroundColor=[UIColor redColor];
    [self.view addSubview:v111];
    v111.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    
    [v111 addGestureRecognizer:tap];

}
-(void)click{
    
    NSLog(@"点击时间");
    
    [GPSManager getGPSLocation:^(CLLocationDegrees latitude, CLLocationDegrees longitude) {
        NSLog(@"纬度：%lf, 经度：%lf", latitude, longitude);
        [GPSManager stop];
    }];
}


-(void)tapClick{
    NSLog(@"qpasjdhjsd");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
