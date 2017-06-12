//
//  ListViewController.h
//  fengzhuang
//
//  Created by 章为 on 16/6/17.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "ParentViewController.h"
typedef NS_ENUM(NSInteger,ZWRequesTpye) {
    Get = 0,
    Post,
};
@interface ListViewController : ParentViewController{
    /**
     *  上拉，下拉刷新，默认为NO，有刷新
     */
    BOOL giveUpRefresg;
    
}


@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *baseDataArray;
@property(nonatomic,strong)NSMutableDictionary *dic;
@property(nonatomic)ZWRequesTpye RequesTpye;
- (void)onRefresh;
-(void)unRefresh;
- (void)loadData;
-(void)initpage;
/**
 *  注册cell
 */
-(void)registerNib:(NSString *)cellName;
/**
 *  基础设置
 */
-(void)listInit;
/**
 *  请求数据 .type 传参为GetRequse or PostRequse
 */
-(void)RequestUrl:(NSString *)url withDic:(NSDictionary *)dic RequesTpye:(ZWRequesTpye)type;
/**
 *  获取数据，转成模型(此处接受数据或做其他操作，必须实现)
 */
-(void)dataWithModel:(id)responseObject;

/**
 *  请求失败处理方法
 */
-(void)requestError;
/**请求失败message 。。image*/
-(void)requestErrorPrompt:(NSString *)title andImage:(NSString *)image;

/**
 *  无数据提示方法
 */
-(void)PromptInformation;
/**无数据提示image 和位置*/
-(void)NODataPromptImageStr:(NSString *)ImageStr CGSizwFram:(CGRect)rect;
//cj
@property(nonatomic)BOOL useUUID;
@end
