//
//  PPSDViewController.m
//  DailyAction
//
//  Created by 蔺雪菲尘 on 14-6-16.
//  Copyright (c) 2014年 Bonnie. All rights reserved.
//

#import "PPSDViewController.h"
#import "UIColor+Random.h"

@interface PPSDViewController ()

@end

@implementation PPSDViewController{
    NSArray *listData;
    NSArray *nameArray;
    NSArray *degreeArray;
    NSArray *timeArray;
    UITableView *listTableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //标题
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 44)];
    titleLabel.text = @"行动日志";
    titleLabel.font = [UIFont boldSystemFontOfSize:25];
    titleLabel.textColor = [UIColor purpleColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.adjustsFontSizeToFitWidth =YES;//设置字体大小适应label宽度
     [self.view addSubview:titleLabel];
    
    //左键
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 25, 30, 30)];
    [leftButton setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [self.view addSubview:leftButton];
    [leftButton addTarget:self action:@selector(clickLeftButton) forControlEvents:UIControlEventTouchUpInside];
    
    //右键
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(275, 25, 30, 30)];
    [rightButton setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [self.view addSubview:rightButton];
    [rightButton addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    
    //创建自定义表格
    listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 320.f, 484)];
    listTableView.delegate = self;
    listTableView.dataSource =self;
    [self.view addSubview:listTableView];
    
//数据源
    nameArray = [[NSArray alloc]initWithObjects:@"编程",@"学英语",@"运动", nil];
    degreeArray = [[NSArray alloc]initWithObjects:@"A",@"B",@"C", nil];
    timeArray = [[NSArray alloc]initWithObjects:@"2小时",@"1小时",@"0.5小时" ,nil];
}

-(void)clickLeftButton{
    NSLog(@"点击进入历史页面");
}

-(void)clickRightButton{
    NSLog(@"点击添加计划");
}

//实现tableview协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [nameArray count];
}

//行距
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


//添加每一行信息
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ident = @"aa";
    UITableViewCell *cell = [listTableView cellForRowAtIndexPath:indexPath ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ident];
                }
    cell.backgroundColor = [UIColor randomColor];
    
    UILabel *blankLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 310, 80)];
    blankLabel.backgroundColor =[UIColor whiteColor];
    [cell.contentView addSubview:blankLabel];

    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(85.0f, 15.0f, 150.0f, 60.0f)];
    nameLabel.text = [nameArray objectAtIndex:indexPath.row];
    nameLabel.font=[UIFont fontWithName:@"Heiti" size:25.0f];
    [cell.contentView addSubview:nameLabel];
    return cell;
    
                }
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPat{
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
