//
//  UIImageView+ZWImage.h
//  CameraBeautiful
//
//  Created by 章为 on 16/6/7.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZWImage)


//封装SD
-(void)sd_setImageWithStrURL:(NSString *)url placeholderImage:(UIImage *)placeholderImage;
@end
