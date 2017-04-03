//
//  EditViewController.m
//  ResearchProject
//
//  Created by Apple on 2017/4/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    UITableView *searchListView = [[UITableView alloc] initWithFrame:self.view.bounds];
    searchListView.dataSource = self;
    searchListView.delegate = self;
    [self.view addSubview:searchListView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource & Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    cell.textLabel.text = [NSString stringWithFormat:@"test %d", indexPath.row];
    return cell;
}

@end
