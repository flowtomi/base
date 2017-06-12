//
//  ParentViewController.h
//  CameraBeautiful
//
//  Created by 章为 on 16/6/6.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWHTTPTool.h"
#import <MBProgressHUD.h>

@interface ParentViewController : UIViewController{
    
    BOOL _NavLetfHidden ;  //是否隐藏navleft  YES 隐藏，NO 不隐藏
}
/**
 *  隐藏Nav 属性
 */
@property(nonatomic)BOOL NavigationBarHidden;

/**
 * 隐藏电量条
 */
@property(nonatomic)BOOL statusBarHidden;


/**
 *  重写init 方法
 */
-(void)myInit;
/**
 *  设置title样式
 */
-(void)viewControllerWithTitle:(NSString *)title;



/**
 *  设置导航栏left 样式
 *
 *  @param image 类似于返回按钮image
 *  @param left  title
 */
-(void)viewControllerNavLeftBtn:(NSString *)image leftStr:(NSString *)left;

/**
 *  MBP提示视图..不中断用户操作
 */
-(void)MBPpromptTitle:(NSString *)title promptImage:(NSString *)image;

/**
 *  MBP等待视图..中断用户操作
 */
-(void)MBP:(MBProgressHUD *)hud MBPpromptTitle:(NSString *)title detail:(NSString *)detail promptImage:(NSString *)image;


- (void)onTap;





@end
