//
//  ImageViewController.m
//  CustomTransition
//
//  Created by Tawatchai Sunarat on 3/19/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property (nonatomic, strong) UIImageView *imgV;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    UIImage *img = [UIImage imageNamed:@"apple_logo"];
    self.imgV = [[UIImageView alloc] initWithImage:img];
    self.imgV.translatesAutoresizingMaskIntoConstraints = NO;
    self.imgV.contentMode = UIViewContentModeCenter;
    [self.view addSubview:self.imgV];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_imgV]|"
                                                                     options:0 metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_imgV)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[_imgV]|"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_imgV)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
