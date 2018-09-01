//
//  TableViewController.m
//  PageContrlDemo
//
//  Created by 郭妙友 on 2018/9/2.
//  Copyright © 2018年 miaoyou.gmy. All rights reserved.
//

#import "TableViewController.h"

static NSInteger InstanceCount = 0;

@interface TableViewController ()

@end

@implementation TableViewController{
    NSUInteger _instanceIndex;
}
- (instancetype)init{
    self = [super init];
    if(self){
        _instanceIndex =InstanceCount++;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@",@(_instanceIndex).stringValue, @(indexPath.row).stringValue];
    return cell;
}
@end
