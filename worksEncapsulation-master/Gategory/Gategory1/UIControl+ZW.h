//
//  UIControl+ZW.h
//  fengzhuang
//
//  Created by 章为 on 16/8/10.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (ZW)
/**
 *  添加点击事件间隔时间（防止重复点击）
 */
@property (nonatomic, assign) NSTimeInterval zhw_acceptEventInterval;//添加点击事件的间隔时间

/**
 是否忽略点击事件,不响应点击事件
 */
//@property (nonatomic, assign) BOOL zhw_ignoreEvent;//是否忽略点击事件,不响应点击事件

@end
