//
//  MainViewController.m
//  CustomTransition
//
//  Created by Tawatchai Sunarat on 3/17/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import "MainViewController.h"
#import "OptionsViewController.h"
#import "ImageViewController.h"
#import "CollectionViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) NSArray *cellTitle;
@property (nonatomic, strong) NSArray *cellAction;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cellTitle = @[@"Image View", @"Collection View"];
    self.cellAction = @[@"presentImageController", @"presentCollectionController"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellTitle.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.cellTitle[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"Tap Options for different animations and other settings.";
}

#pragma mark - Table view delegate

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    SEL selector = NSSelectorFromString(self.cellAction[indexPath.row]);
    
    if ([self respondsToSelector:selector]) {
        [self performSelector:selector];
    }
}

#pragma mark - Custom Methods

- (void)presentImageController {
    ImageViewController *imgVC = [[ImageViewController alloc] init];
    imgVC.title = @"Apple";
    [self.navigationController pushViewController:imgVC animated:YES];
}

- (void)presentCollectionController {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(80.0, 80.0);
    CollectionViewController *collecVC = [[CollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
    collecVC.title = @"Apples";
    [self.navigationController pushViewController:collecVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
