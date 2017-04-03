//
//  EditViewController.m
//  ResearchProject
//
//  Created by Apple on 2017/4/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "EditViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "UserAccount+CoreDataModel.h"
#import "AppDelegate.h"

@interface EditViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *allAccounts;
    UITableView *searchListView;
}

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    searchListView = [[UITableView alloc] initWithFrame:self.view.bounds];
    searchListView.dataSource = self;
    searchListView.delegate = self;
    [self.view addSubview:searchListView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAccount:)];
    
    // Load database
    allAccounts = [[NSMutableArray alloc] initWithArray:[UserAccount MR_findAll]];
    NSLog(@"accounts number: %d", allAccounts.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (void)addAccount:(id)sender
{
    NSLog(@"show alertview");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"New account" message:@"請輸入帳號與密碼" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"email";
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"password";
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:cancelAction];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Load the data
        NSString *accountEmail = alertController.textFields.firstObject.text;
        NSString *accountPwd = alertController.textFields.lastObject.text;
        
        NSTimeInterval createTime = [[NSDate date] timeIntervalSince1970];
        
        // Save the data
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
            UserAccount *newAccount = [UserAccount MR_createEntity];
            newAccount.email = accountEmail;
            newAccount.password = accountPwd;
            newAccount.update_time = createTime;
            [localContext MR_saveToPersistentStoreAndWait];
            
            // update array information
            [allAccounts removeAllObjects];
            [allAccounts addObjectsFromArray:[UserAccount MR_findAll]];
            
            // reload the tableview
            dispatch_async(dispatch_get_main_queue(), ^{
                [searchListView reloadData];
            });
            
        }];
        
    }];
    [alertController addAction:saveAction];
    
    [self presentViewController:alertController animated:YES completion:nil ];
    
}

#pragma mark - UITableView Datasource & Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return allAccounts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    
    UserAccount *account = allAccounts[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"email: %@", account.email];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"pwd: %@", account.password];
    
    return cell;
}

@end
