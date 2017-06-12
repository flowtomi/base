//
//  ZWHTTPTool.m
//  CameraBeautiful
//
//  Created by 章为 on 16/6/16.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "ZWHTTPTool.h"
#import <AFNetworking.h>
#import "MBProgressHUD.h"
static ZWHTTPTool *sharedManager=nil; //放入外部

@interface ZWHTTPTool ()

@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation ZWHTTPTool


+(instancetype)sharedManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedManager=(ZWHTTPTool *)@"ZWHTTPTool";
        sharedManager=[ZWHTTPTool new];
    });
    //防止子类使用
    NSString *classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"ZWHTTPTool"]==NO) {
        NSParameterAssert(nil);
    }
    return sharedManager;
}
//重新init方法，防止该类被重新实例化
-(instancetype)init{
    NSString *str=(NSString *)sharedManager;
    if ([str isKindOfClass:[NSString class]]==YES && [str isEqualToString:@"ZWHTTPTool"]) {
        self=[super init];
        if (self) {
            NSString *classString = NSStringFromClass([self class]);
            if ([classString isEqualToString:@"ZWHTTPTool"]==NO) {
                NSParameterAssert(nil);
            }
        }
        return self;
    }else{
        return nil;
    }
}



//POST 请求
- (void)postPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void(^)(id relust))rblock andError:(void(^)(NSError *error))eblock{
    
    void(^_rblock)(id relust) = [rblock copy];
    void(^_eblock)(NSError *error) = [eblock copy];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html", nil];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager POST:path parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if (json) {
            _rblock(json);
        }else{
            _rblock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        _eblock(error);
        [self requestErrorPrompt:NSLocalizedString(@"网络不给力~", nil) andImage:@"picture_no_network_prompt"];
    }];
}
//get
-(void)getPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))rblock andError:(void(^)(NSError *error))eblock{
    
    void(^_grblock)(id relust) = [rblock copy];
    void(^_geblock)(NSError *error) = [eblock copy];
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html", nil];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            _grblock(json);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        _geblock(error);
        [self requestErrorPrompt:NSLocalizedString(@"网络不给力~", nil) andImage:@"picture_no_network_prompt"];
    }];
}
//请求失败提示信息
-(void)requestErrorPrompt:(NSString *)title andImage:(NSString *)image{
    
    
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

@end
