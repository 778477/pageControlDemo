//
//  ViewController.m
//  PageContrlDemo
//
//  Created by 郭妙友 on 2018/9/2.
//  Copyright © 2018年 miaoyou.gmy. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ACell : UITableViewCell

@end


@implementation ACell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
    }
    return self;
}

@end

#pragma mark -

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *pageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pages = @[[TableViewController new],
                   [TableViewController new],
                   [TableViewController new],
                   [TableViewController new],
                   [TableViewController new],
                   [TableViewController new],
                   [TableViewController new],
                   [TableViewController new],
                   [TableViewController new]];
//    [self.view addSubview:self.tableView];
    [self.view addSubview:self.pageView];
}


#pragma mark - 

- (UIScrollView *)pageView{
    if(!_pageView){
        _pageView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _pageView.contentSize = CGSizeMake(_pageView.frame.size.width * self.pages.count, _pageView.frame.size.height);
        _pageView.pagingEnabled = YES;
        
        for(NSUInteger i = 0;i<self.pages.count; ++i){
            UIView *view = self.pages[i].view;
            view.frame = CGRectMake(_pageView.frame.size.width * i, 0, view.frame.size.width, view.frame.size.height);
            [_pageView addSubview:view];
        }
        
    }
    return _pageView;
}


- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.pagingEnabled = YES;
        _tableView.showsHorizontalScrollIndicator = _tableView.showsVerticalScrollIndicator = NO;
        _tableView.contentSize = CGSizeMake(self.view.frame.size.width * self.pages.count, self.view.frame.size.height);
        [_tableView registerClass:[ACell class] forCellReuseIdentifier:@"ACell"];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.pages.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.frame.size.height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ACell *cell = [tableView dequeueReusableCellWithIdentifier:@"ACell" forIndexPath:indexPath];
    [cell.contentView addSubview:self.pages[indexPath.row].view];
    return cell;
}
 

@end
