//
//  model.m
//  fengzhuang
//
//  Created by 章为 on 16/6/17.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "model.h"

@implementation model




@end



@implementation Data

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [List class]};
}

@end


@implementation List

+ (NSDictionary *)objectClassInArray{
    return @{@"tagslist" : [Tagslist class], @"comments" : [Comments class], @"like_avatar" : [Like_Avatar class]};
}

@end


@implementation Userinfo

@end


@implementation Lastphoto1

@end


@implementation Tagslist

@end


@implementation Comments

@end


@implementation Lastphoto

@end


@implementation Reply_User

@end


@implementation Replyed_User

@end


@implementation Like_Avatar

@end


