//
//  ViewController.m
//  iOS动画集合
//
//  Created by mzq on 16/7/28.
//  Copyright © 2016年 bww. All rights reserved.
//

#import "ViewController.h"
#import "CA_ViewController.h"
#import "UIView_ViewController.h"
#import "CGAffineTransformVController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"iOS动画";
    
    _dataArray = @[@"核心动画  CAAniamtion",@"UIView 动画",@"CGAffineTransform"];
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
      
        CA_ViewController * view = [[CA_ViewController alloc]init];
        
        [self.navigationController pushViewController:view animated:YES];
        
    } else if (indexPath.row == 1) {
    
        UIView_ViewController * view = [[UIView_ViewController alloc]init];
        
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 2) {
        CGAffineTransformVController * trasform = [[CGAffineTransformVController alloc]init];
        [self.navigationController pushViewController:trasform animated:YES];
    }

}
@end
