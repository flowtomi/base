//
//  model.h
//  fengzhuang
//
//  Created by 章为 on 16/6/17.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data,List,Userinfo,Lastphoto1,Tagslist,Comments,Lastphoto,Reply_User,Replyed_User,Like_Avatar;
@interface model : NSObject


@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) Data *data;

@property (nonatomic, assign) NSInteger code;





@end
@interface Data : NSObject

@property (nonatomic, strong) NSArray<List *> *list;

@property (nonatomic, strong) NSArray *live;

@end

@interface List : NSObject

@property (nonatomic, copy) NSString *account;

@property (nonatomic, copy) NSString *cityname;

@property (nonatomic, strong) Lastphoto1 *lastphoto;

@property (nonatomic, strong) NSArray<Tagslist *> *tagslist;

@property (nonatomic, copy) NSString *modified_at;

@property (nonatomic, copy) NSString *is_live;

@property (nonatomic, copy) NSString *comments_count;

@property (nonatomic, assign) BOOL is_like;

@property (nonatomic, strong) NSArray *dashang;

@property (nonatomic, strong) Userinfo *userinfo;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *poi_city;

@property (nonatomic, copy) NSString *poi_city_en;

@property (nonatomic, copy) NSString *likes_count;

@property (nonatomic, copy) NSString *like_avatar_count;

@property (nonatomic, copy) NSString *last_updatetime;

@property (nonatomic, strong) NSArray<Like_Avatar *> *like_avatar;

@property (nonatomic, strong) NSArray<Comments *> *comments;

@property (nonatomic, copy) NSString *room_id;

@property (nonatomic, copy) NSString *dashang_count;

@property (nonatomic, copy) NSString *description;

@end

@interface Userinfo : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *avatar_file;

@property (nonatomic, assign) BOOL is_follow;

@end

@interface Lastphoto1 : NSObject

@property (nonatomic, copy) NSString *height;

@property (nonatomic, copy) NSString *creation_time;

@property (nonatomic, copy) NSString *suffix;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *last_updatetime;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *taking_time;

@property (nonatomic, assign) NSInteger photos_count;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *image_small;

@end

@interface Tagslist : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@end

@interface Comments : NSObject

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *type_id;

@property (nonatomic, copy) NSString *created_at;

@property (nonatomic, copy) NSString *last_updatetime;

@property (nonatomic, strong) Replyed_User *replyed_user;

@property (nonatomic, strong) Lastphoto *lastphoto;

@property (nonatomic, strong) Reply_User *reply_user;

@end

@interface Lastphoto : NSObject

@property (nonatomic, copy) NSString *height;

@property (nonatomic, copy) NSString *suffix;

@property (nonatomic, assign) NSInteger photos_count;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *image_small;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *momentid;

@property (nonatomic, copy) NSString *taking_time;

@property (nonatomic, copy) NSString *image;

@end

@interface Reply_User : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *avatar_file;

@end

@interface Replyed_User : NSObject

@end

@interface Like_Avatar : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *avatar_file;

@end

