//
//  ViewController.m
//  ResearchProject
//
//  Created by Apple on 2017/4/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "SearchDeviceViewController.h"
#import "EditViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStylePlain target:self action:@selector(clickToSearchDevice:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(clickToEditLocalData:)];
    self.navigationItem.title = @"Welcome";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action

- (void)clickToSearchDevice:(id)sender
{
    SearchDeviceViewController *searchViewController = [[SearchDeviceViewController alloc] init];
    searchViewController.navigationItem.title = @"Search";
    [self.navigationController pushViewController:searchViewController animated:YES];
}

- (void)clickToEditLocalData:(id)sender
{
    EditViewController *searchViewController = [[EditViewController alloc] init];
    searchViewController.navigationItem.title = @"Edit";
    [self.navigationController pushViewController:searchViewController animated:YES];
}


@end
