//
//  TestViewController.m
//  CameraBeautiful
//
//  Created by 章为 on 16/6/6.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "TestViewController.h"
#import "ViewController.h"
#import "model.h"
#import <MJExtension.h>
@interface TestViewController ()

@end

@implementation TestViewController



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"EXCell" forIndexPath:indexPath];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EXCell"];
    }
   cell.textLabel.text = @"text";
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(void)loadData{
    NSString *url=@"http://api.starlivedev.com/api/User/getFeedsMoments?uuid=F2B3AF47-59B4-4605-B419-2D9A519CCBDE";
    [self RequestUrl:url withDic:nil RequesTpye:Get];
    
}

-(void)dataWithModel:(id)responseObject{
    
    model *m=[model mj_objectWithKeyValues:responseObject];
    
    [self.baseDataArray addObjectsFromArray:m.data.list];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    //self.view.backgroundColor=[UIColor redColor];
    
    
}
    
//    [UIApplication sharedApplication].statusBarHidden=YES;
//    NSLog(@"=====字类");
//    [super viewDidLoad];
//    NSLog(@"字类");
//   // [self viewControllerNavLeftBtn:nil leftStr:nil];
//    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
//    btn.backgroundColor=[UIColor orangeColor];
//    
//    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    
//    btn.frame=CGRectMake(30, 70, 80, 80);
//    btn.center=self.view.center;
//    [self.view addSubview:btn];
    
//    NSString *url=@"http://linktu.starlivedev.com/api/Home/getVersionInfo?type=1&version=2.0.1";
//   
//    [self RequestUrl:url withDic:nil RequesTpye:GetRequse];
    
    


//-(void)dataWithModel:(id)responseObject{
//    
//    NSLog(@"返回方法===%@",responseObject);
//    
//}
//
//-(void)click{
//
//    ViewController *v=[[ViewController alloc]init];
//    [self.navigationController pushViewController:v animated:YES];
//
//}



@end
