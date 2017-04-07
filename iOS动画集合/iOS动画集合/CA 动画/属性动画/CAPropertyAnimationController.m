//
//  CAPropertyAnimationController.m
//  iOS动画集合
//
//  Created by mzq on 16/7/28.
//  Copyright © 2016年 bww. All rights reserved.
//

#import "CAPropertyAnimationController.h"

#import "CABasicAnimationVController.h"
#import "CAKeyframeAnimationVController.h"
#import "CASpringAnimationVController.h"

@interface CAPropertyAnimationController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray * dataArray;

@end

@implementation CAPropertyAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"PropertyAnimation 属性动画";
    
    _dataArray = @[@"CABasicAnimation  基础动画",@"CAKeyframeAnimation 关键帧动画",@"CASpringAnimation 弹簧动画"];
    
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
        CABasicAnimationVController * basic = [[CABasicAnimationVController alloc]init];
        [self.navigationController pushViewController:basic animated:YES];
                
    } else if (indexPath.row == 1) {
        CAKeyframeAnimationVController * keyframe = [[CAKeyframeAnimationVController alloc]init];
        [self.navigationController pushViewController:keyframe animated:YES];
        
    } else if (indexPath.row == 2) {
        CASpringAnimationVController * spring = [[CASpringAnimationVController alloc]init];
        [self.navigationController pushViewController:spring animated:YES];
    }
    
}


@end

