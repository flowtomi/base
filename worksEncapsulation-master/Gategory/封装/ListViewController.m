//
//  ListViewController.m
//  fengzhuang
//
//  Created by 章为 on 16/6/17.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "ListViewController.h"
#import "MJExtension.h"
#import "MBProgressHUD.h"
#import "UIView+ZW.h"
#import "MJRefresh.h"

// 屏幕宽
#define WIDTH [UIScreen mainScreen].bounds.size.width
// 屏幕高
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSInteger page;
}
@property(nonatomic,strong)MBProgressHUD *hud;
@property(nonatomic,strong)UIImageView *promptImageView;
@end

@implementation ListViewController


-(instancetype)init{
    if (self=[super init]) {
        
        [self listInit];
    }
    return self;
}

-(void)listInit
{
    giveUpRefresg=NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _baseDataArray=[NSMutableArray array];
    _dic=[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%zd",page],@"page", nil];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.estimatedRowHeight=120;
    UIView *view = [[UIView alloc]init];
    _tableView.tableFooterView = view;
    [self.view addSubview:_tableView];
    
    //是否做上拉，下拉刷新，默认有
    if (!giveUpRefresg) {
        [self onRefresh];
        [self unRefresh];
    }else{
        [self loadData];
    }
    
    _promptImageView=[[UIImageView alloc]init];
    [_tableView addSubview:_promptImageView];
}



//下拉刷新
- (void)onRefresh{
    
    MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        
        [self initPage1];
        [self.dic setValue:[NSString stringWithFormat:@"%zd",page] forKey:@"page"];
        [self loadData];
        [_tableView.mj_header endRefreshing];
    }];
    self.tableView.mj_header=header;
    [_tableView.mj_header beginRefreshing];
}
-(void)initPage1{
    page=0;
}
//上啦加载
-(void)unRefresh{
    
    MJRefreshAutoNormalFooter *footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //下载数据
        page++;
        
        NSLog(@"page---%zd",page);
        
        [self.dic setValue:[NSString stringWithFormat:@"%zd",page] forKey:@"page"];
        [self loadData];
        [_tableView.mj_footer endRefreshing];
    }];
    footer.stateLabel.text=@"";
    footer.automaticallyRefresh=NO;
    _tableView.mj_footer=footer;
    
}


-(void)RequestUrl:(NSString *)url withDic:(NSDictionary *)dic RequesTpye:(ZWRequesTpye)type {
    if (type ==Post) {
        NSDictionary *parameter=[NSDictionary dictionaryWithDictionary:dic];
        [[ZWHTTPTool sharedManager] postPath:url parameters:parameter success:^(id responseObject) {
            if ([parameter[@"page"] intValue]!=page) {
                return ;
            }
            if (self.baseDataArray.count>0&&page==0) {
                [self.baseDataArray removeAllObjects];
            }
            
            [self dataWithModel:responseObject];
            
        } andError:^(NSError *error) {
            
        }];
    }
    if (type == Get) {
        NSDictionary *parameter=[NSDictionary dictionaryWithDictionary:dic];
        [[ZWHTTPTool sharedManager] getPath:url parameters:parameter success:^(id responseObject) {
            if ([parameter[@"page"] intValue]!=page) {
                return ;
            }
            if (self.baseDataArray.count>0&&page==0) {
                [self.baseDataArray removeAllObjects];
            }
            [self dataWithModel:responseObject];
            [self noDataPromptImageView];
        } andError:^(NSError *error) {
            [self requestError];
        }];
    }
}

-(void)noDataPromptImageView{
    
    if (self.baseDataArray.count==0) {
        self.promptImageView.hidden=NO;
        
        [self PromptInformation];
    }else{
        self.promptImageView.hidden=YES;
    }
}

-(void)PromptInformation{
    [self NODataPromptImageStr:@"ZWlike_news" CGSizwFram:CGRectNull];
}


-(void)NODataPromptImageStr:(NSString *)ImageStr CGSizwFram:(CGRect)rect{
    UIImage *image=[UIImage imageNamed:ImageStr];
    _promptImageView.image=image;
    _promptImageView.frame=rect;
    _promptImageView.frame=CGRectMake(0, 0, image.size.width, image.size.height);
    _promptImageView.center=self.view.center;
    _promptImageView.y-=64;
}


-(void)requestError{
    [self requestErrorPrompt:@"网络不给力~" andImage:@"picture_no_network_prompt"];
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
//注册cell
-(void)registerNib:(NSString *)cellName{
    
    [self.tableView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.baseDataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return UITableViewAutomaticDimension;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //以动画方式推出  反选效果，让选中效果消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
