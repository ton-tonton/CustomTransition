//
//  CollectionViewController.m
//  CustomTransition
//
//  Created by Tawatchai Sunarat on 3/19/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 18;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    for (UIView *v in cell.contentView.subviews) {
        [v removeFromSuperview];
    }

    UIImage *img = [UIImage imageNamed:@"apple_logo"];
    UIImageView *imgV = [[UIImageView alloc] initWithImage:img];
    imgV.translatesAutoresizingMaskIntoConstraints = NO;
    imgV.contentMode = UIViewContentModeScaleAspectFit;
    
    [cell.contentView addSubview:imgV];
    
    [cell.contentView removeConstraints:cell.contentView.constraints];
    [cell.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"H:|[imgV]|"
                                      options:0                                      
                                      metrics:nil
                                      views:NSDictionaryOfVariableBindings(imgV)]];
    
    [cell.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"V:|[imgV]|"
                                      options:0
                                      metrics:nil
                                      views:NSDictionaryOfVariableBindings(imgV)]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

@end
