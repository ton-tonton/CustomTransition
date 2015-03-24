//
//  OptionsViewController.m
//  CustomTransition
//
//  Created by Tawatchai Sunarat on 3/17/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSArray *cellTitles;
@property (nonatomic, strong) NSArray *cellActions;

@property (nonatomic, strong) UISwitch *transitionSwitch;
@property (nonatomic, strong) NSString *navigationTransition;

@end

@implementation OptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sectionTitles  = @[@"GENERAL", @"TRANSITION TYPE"];
    self.cellTitles     = @[@[@"NAV Transitions"], @[@"3D Slide", @"Shuffle", @"Scale"]];
    self.cellActions    = @[@[@"toggleTransitions"], @[@"enableSlideAnimation", @"enableShuffleAnimation", @"enableScaleAnimation"]];
    
    self.transitionSwitch = [[UISwitch alloc] init];
    [self.transitionSwitch addTarget:self
                              action:@selector(switchWasChanged)
                    forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionTitles.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionTitles[section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return @"The scale animation is interactive using a pinch gesture.";
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cellTitles[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.cellTitles[indexPath.section][indexPath.row];
    
    if (indexPath.section == 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.transitionSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:USER_DEFAULTS_CUSTOM_TRANSITIONS];
        cell.accessoryView = self.transitionSwitch;
    } else {
        NSString *transition = [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEFAULTS_NAVIGATION_TRANSITION];
        if (indexPath.row == 0 && [transition isEqualToString:USER_DEFAULTS_NAVIGATION_TRANSITION_SLIDE]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        } else if (indexPath.row == 1 && [transition isEqualToString:USER_DEFAULTS_NAVIGATION_TRANSITION_FLIP]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        } else if (indexPath.row == 2 && [transition isEqualToString:USER_DEFAULTS_NAVIGATION_TRANSITION_SCALE]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        }else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    return cell;
}

#pragma mark - table view delegate

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SEL selector = NSSelectorFromString(self.cellActions[indexPath.section][indexPath.row]);
    if ([self respondsToSelector:selector]) {
        [self performSelector:selector];
    }
}

#pragma mark - action

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)switchWasChanged {
    [[NSUserDefaults standardUserDefaults] setBool:self.transitionSwitch.on
                                            forKey:USER_DEFAULTS_CUSTOM_TRANSITIONS];
}

- (void)toggleTransitions {
    [self.transitionSwitch setOn:!self.transitionSwitch.on animated:YES];
}

- (void)enableSlideAnimation {
    [[NSUserDefaults standardUserDefaults] setObject:USER_DEFAULTS_NAVIGATION_TRANSITION_SLIDE forKey:USER_DEFAULTS_NAVIGATION_TRANSITION];
    [self.tableView reloadData];
}

-(void)enableShuffleAnimation {
    [[NSUserDefaults standardUserDefaults] setObject:USER_DEFAULTS_NAVIGATION_TRANSITION_FLIP forKey:USER_DEFAULTS_NAVIGATION_TRANSITION];
    [self.tableView reloadData];
}

-(void)enableScaleAnimation {
    [[NSUserDefaults standardUserDefaults] setObject:USER_DEFAULTS_NAVIGATION_TRANSITION_SCALE forKey:USER_DEFAULTS_NAVIGATION_TRANSITION];
    [self.tableView reloadData];
}


@end
