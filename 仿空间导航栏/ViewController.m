//
//  ViewController.m
//  仿空间导航栏
//
//  Created by 苗建浩 on 2017/1/4.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Header.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) UIImageView *headImage;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.alpha = 0;
    [self homeTableViewInterface];
    
    
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 64)];
    self.navView.backgroundColor = [UIColor redColor];
    self.navView.alpha = 0;
    [self.view addSubview:self.navView];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, screenWidth, 44)];
    titleLabel.text = @"首页";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.navView addSubview:titleLabel];
    
    
}

- (void)homeTableViewInterface{
    self.homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHight) style:UITableViewStyleGrouped];
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
    self.homeTableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.homeTableView];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 100)];
    mainView.backgroundColor = [UIColor grayColor];
    
    
    self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 200)];
    self.headImage.image = [UIImage imageNamed:@"background"];
    [mainView addSubview:self.headImage];
    
    
    return mainView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset_Y = scrollView.contentOffset.y;
    CGFloat alpha = (offset_Y - 64)/100.0f;
    
    
    if (alpha <= 0) {
        self.navView.alpha = 0;
    }else {
        self.navView.alpha = alpha;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
