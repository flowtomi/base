//
//  UIView+ZW.h
//  CameraBeautiful
//
//  Created by 章为 on 16/6/7.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZW)


- (CGPoint)origin;
- (void)setOrigin:(CGPoint) point;

- (CGSize)size;
- (void)setSize:(CGSize) size;

- (CGFloat)x;
- (void)setX:(CGFloat)x;

- (CGFloat)y;
- (void)setY:(CGFloat)y;


- (CGFloat)height;
- (void)setHeight:(CGFloat)height;


- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)tail;
- (void)setTail:(CGFloat)tail;

- (CGFloat)bottom;
- (void)setBottom:(CGFloat)bottom;

- (CGFloat)right;
- (void)setRight:(CGFloat)right;

@property(nonatomic)CGFloat layerZ;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/**
 *  添加手势
 */
-(void)zw_TapGestureRecognizer:(void(^)(void))block;

@end
