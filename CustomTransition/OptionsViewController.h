//
//  OptionsViewController.h
//  CustomTransition
//
//  Created by Tawatchai Sunarat on 3/17/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import <UIKit/UIKit.h>

#define USER_DEFAULTS_CUSTOM_TRANSITIONS @"CustomTransitionsEnabled"
#define USER_DEFAULTS_NAVIGATION_TRANSITION @"NavigationTransition"
#define USER_DEFAULTS_NAVIGATION_TRANSITION_SLIDE @"NavigationSlide"
#define USER_DEFAULTS_NAVIGATION_TRANSITION_FLIP @"NavigationFlip"
#define USER_DEFAULTS_NAVIGATION_TRANSITION_SCALE @"NavigationScale"

@interface OptionsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end
