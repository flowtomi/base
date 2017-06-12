//
//  ParentViewController.m
//  CameraBeautiful
//
//  Created by 章为 on 16/6/6.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "ParentViewController.h"
#import "UIView+ZW.h"
@interface ParentViewController (){
    
}
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation ParentViewController



-(instancetype)init{
    if (self=[super init]) {
        [self myInit];
    }
    return self;
}

-(void)myInit{
    _NavLetfHidden=NO;
    self.NavigationBarHidden=NO;
     self.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_NavLetfHidden) {
        [self viewControllerNavLeftBtn:@"ZW2btn_icon_arrowleft" leftStr:nil];
    }
}

/**
 *  设置title样式
 */
-(void)viewControllerWithTitle:(NSString *)title{
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:UIColorFromRGB(0x262626)}];
    self.title=title;
    
}


-(void)viewControllerNavLeftBtn:(NSString *)image leftStr:(NSString *)left{
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image1=[UIImage imageNamed:image];
    
    [leftBtn setImage:image1 forState:UIControlStateNormal];
    [leftBtn setTitle:left forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    leftBtn.frame = CGRectMake(10, 7,42, 42);
    [leftBtn addTarget:self action:@selector(onTap) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    
}

-(void)MBPpromptTitle:(NSString *)title promptImage:(NSString *)image{
    
    UIView *view=[[UIApplication sharedApplication].delegate window];
    _hud=[MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.removeFromSuperViewOnHide=YES;
    if (image.length>0) {
        UIImage *image1=[UIImage imageNamed:image];
        UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image1.size.width, image1.size.height)];
        iv.image=image1;
        _hud.mode = MBProgressHUDModeCustomView;
        _hud.customView = iv;
    }
    _hud.detailsLabelText=title;
    _hud.detailsLabelFont=[UIFont systemFontOfSize:13];
    // _hud.labelText=title;
    [_hud hide:YES afterDelay:3*0.618];
    
}
/**
 *  MBP提示..中断用户操作
 */
-(void)MBP:(MBProgressHUD *)hud MBPpromptTitle:(NSString *)title detail:(NSString *)detail promptImage:(NSString *)image{
    
    UIView *view=[[UIApplication sharedApplication].delegate window];
    hud=[MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide=YES;
    if (image.length>0) {
        UIImage *image1=[UIImage imageNamed:image];
        UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image1.size.width, image1.size.height)];
        iv.image=image1;
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = iv;
    }
    hud.labelText=title;
    hud.detailsLabelText=detail;
    hud.detailsLabelFont=[UIFont systemFontOfSize:13];
    
}

- (void)onTap {
    NSLog(@"返回");
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.NavigationBarHidden];
    [UIApplication sharedApplication].statusBarHidden = _statusBarHidden;
}




-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    [UIApplication sharedApplication].statusBarHidden = NO;
}

/**
 //    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
 //   [manager POST:Zupload parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
 //        for (int i=0; i<_DAimage.count; i++) {
 //            NSData *dataImage=UIImageJPEGRepresentation(_DAimage[i], 0.5);
 //            [formData appendPartWithFileData:dataImage name:@"file[]" fileName:@"text.jpg" mimeType:@"image/jpeg"];
 //        }
 //    } progress:^(NSProgress * _Nonnull uploadProgress) {
 //
 //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
 //
 //        [hud hide:YES];
 //        [[ZWHTTPTool sharedManager] MBPMessage:@"上传成功..."];
 //
 //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
 //    }];
 
 //  NSString *s = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
 
 
 NSLog(@"字符串===%@",responseObject);
 
 //        NSString *ss = [[s componentsSeparatedByString:@"</div>{"] lastObject];
 //        NSString *sss = [[ss componentsSeparatedByString:@"}}}"] firstObject];
 //        NSString *json = [NSString stringWithFormat:@"{%@}}}",sss];
 //
 
 
 
 //        NSData *data = [s dataUsingEncoding:NSUTF8StringEncoding];
 //        id j = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
 
 
 
 
 //  NSLog(@"%@",j);
 
 //    NSLog(@"数据返回成功打印====%@",responseObject);
 //        NSString *s = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
 //  ZWWorksModel *model=[ZWWorksModel mj_objectWithKeyValues:j];
 
 //  NSLog(@"转成字符串===%@",model.data.Description);
 
 #pragma mark --- 返回数据解析未完成---
 //        id da=[NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
 //        NSDictionary * userInfo = [NSJSONSerialization
 
 
 //        NSDictionary * userInfo = [NSJSONSerialization
 //                                   JSONObjectWithData:[responseObject dataUsingEncoding:NSUTF8StringEncoding]
 //                                   options:NSJSONReadingMutableLeaves
 //                                   error:nil];
 
 //   NSLog(@"==%@",userInfo);
 
 // NSJSONSerialization *data
 // NSString *str=[NSString stringWithUTF8String:[responseObject bytes]];
 
 
 
 
 
 //        NSLog(@"resp====成功%@",model.data.parentid);
 //        NSLog(@"====%@",responseObject);
 NSString *topicname=[ZUserDefault objectForKey:@"topicname"];
 if (topicname.length>0) {
 [ZUserDefault setObject:nil forKey:@"topicname"];
 [ZUserDefault synchronize];
 }
 [hud hide:YES];
 [[ZWHTTPTool sharedManager] MBPMessage:@"上传成功..."];
 
 //        RootViewController *r=(RootViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
 //        r.selectedIndex=0;
 
 //  NSLog(@"r======%@",r);
 
 //  [self.navigationController popToRootViewControllerAnimated:YES];
 
 
 
 //  [self.navigationController popToViewController:r animated:YES];
 //[self.navigationController pushViewController:r animated:YES];
 
 //        [self.navigationController popViewControllerAnimated:NO];
 NSArray *share=@[weixin,friend,responseObject];
 //        NSNotification *off=[[NSNotification alloc]initWithName:@"off" object:@"1" userInfo:nil];
 //        [[NSNotificationCenter defaultCenter] postNotification:off];
 //
 //        NSNotification *off1=[[NSNotification alloc]initWithName:@"off1" object:share userInfo:nil];
 //        [[NSNotificationCenter defaultCenter] postNotification:off1];
 
 */

@end
