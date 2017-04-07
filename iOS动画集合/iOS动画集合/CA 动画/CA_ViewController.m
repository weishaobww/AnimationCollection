//
//  CA_ViewController.m
//  iOS动画集合
//
//  Created by mzq on 16/7/28.
//  Copyright © 2016年 bww. All rights reserved.
//

#import "CA_ViewController.h"
#import "CAPropertyAnimationController.h"
#import "CAAnimationGroupViewController.h"
#import "CATransitionViewController.h"


@interface CA_ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray * dataArray;

@end

@implementation CA_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.title = @"核心动画 CAnimation";
    
    _dataArray = @[@"CAPropertyAnimation 属性动画",@"CAAnimationGroup 动画组",@"CATransition    转场动画",@"核心动画理解"];
    
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
    if (indexPath.row == 0) {
        
        CAPropertyAnimationController * view = [[CAPropertyAnimationController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
        
    } else if (indexPath.row == 1) {
        CAAnimationGroupViewController * view = [[CAAnimationGroupViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
        
    } else if (indexPath.row == 2) {
    
        CATransitionViewController * view = [[CATransitionViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
        
    } else if (indexPath.row == 3) {
    
    }
    
}
@end

