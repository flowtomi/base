//
//  ZWHTTPTool.h
//  CameraBeautiful
//
//  Created by 章为 on 16/6/16.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWHTTPTool : NSObject

+(instancetype)sharedManager;

//POST 请求
-(void)postPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))rblock andError:(void(^)(NSError *error))eblock;
//get 请求
-(void)getPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))rblock andError:(void(^)(NSError *error))eblock;

@end
