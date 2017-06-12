//
//  UIImageView+ZWImage.m
//  CameraBeautiful
//
//  Created by 章为 on 16/6/7.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "UIImageView+ZWImage.h"
#import <UIImageView+WebCache.h>
@implementation UIImageView (ZWImage)


-(void)sd_setImageWithStrURL:(NSString *)url placeholderImage:(UIImage *)placeholderImage{
    
    if (placeholderImage == nil) {
        placeholderImage = [UIImage imageNamed:@""];   //此处可以设置默认图片
    }
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage];
}

@end
