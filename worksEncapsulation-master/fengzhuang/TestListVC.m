//
//  TestListVC.m
//  fengzhuang
//
//  Created by 章为 on 16/6/17.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "TestListVC.h"
#import "model.h"
#import <MJExtension.h>
@interface TestListVC ()

@end

@implementation TestListVC

-(void)listInit{
    giveUpRefresg=NO;
    _NavLetfHidden=NO;
    self.NavigationBarHidden=NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *inden=@"EXCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:inden ];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inden];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"texte==%zd",indexPath.row];
    return cell;
    
}




-(void)loadData{
    NSString *url=@"http://api.starlivedev.com/api/User/getFeedsMoments?uuid=F2B3AF47-59B4-4605-B419-2D9A519CCBDE";
    //url=@"http://api.starli";
    url=@"http://api.starlivedev.com/api/User/getFeedsMoments?uuid=E0BCB773-5B89-459C-B904-EBE9505243EA";
    [self RequestUrl:url withDic:self.dic RequesTpye:Get];
    
}

-(void)dataWithModel:(id)responseObject{
    
    model *m=[model mj_objectWithKeyValues:responseObject];
    [self.baseDataArray addObjectsFromArray:m.data.list];
    [self.tableView reloadData];
}

-(void)requestError{
    [self requestErrorPrompt:@"网络错误" andImage:nil];
}

-(void)PromptInformation{
    
    [self NODataPromptImageStr:@"no_follow_other" CGSizwFram:CGRectNull];
}



@end
