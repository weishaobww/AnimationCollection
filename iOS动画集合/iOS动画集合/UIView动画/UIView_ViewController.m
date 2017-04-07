//
//  UIView_ViewController.m
//  iOS动画集合
//
//  Created by mzq on 16/7/28.
//  Copyright © 2016年 bww. All rights reserved.
//

#import "UIView_ViewController.h"
#import "SingleViewController.h"
#import "CombineViewController.h"
#import "ContextViewController.h"
#import "BlockViewController.h"
#import "KeyframeViewController.h"
#import "OtherViewController.h"

@interface UIView_ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray * dataArray;

@end

@implementation UIView_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"UIView 的动画";
    
    _dataArray = @[@"一个简单的UIView类动画",@"组合的UIView动画",@"上下文动画",@"UIView的block动画",@"关键帧动画",@"其他方法及属性"];
    
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) { //一个简单的UIView类动画
        SingleViewController * single = [[SingleViewController alloc]init];
        [self.navigationController pushViewController:single animated:YES];
        
    } else if (indexPath.row == 1) { //组合的UIView动画
        CombineViewController * combine = [[CombineViewController alloc]init];
        [self.navigationController pushViewController:combine animated:YES];
        
    } else if (indexPath.row == 2) { //上下文动画
        ContextViewController * context = [[ContextViewController alloc]init];
        [self.navigationController pushViewController:context animated:YES];
        
    } else if (indexPath.row == 3) { // UIView的block动画
        BlockViewController * block = [[BlockViewController alloc]init];
        [self.navigationController pushViewController:block animated:YES];
        
    } else if (indexPath.row == 4) { //关键帧动画
        KeyframeViewController * keyframe = [[KeyframeViewController alloc]init];
        [self.navigationController pushViewController:keyframe animated:YES];
        
    } else if (indexPath.row == 5) { //其他方法及属性
        OtherViewController * other = [[OtherViewController alloc]init];
        [self.navigationController pushViewController:other animated:YES];
    }
    
}


@end
