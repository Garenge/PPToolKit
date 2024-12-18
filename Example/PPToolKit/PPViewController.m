//
//  PPViewController.m
//  PPToolKit
//
//  Created by pengpeng on 12/31/2023.
//  Copyright (c) 2023 pengpeng. All rights reserved.
//

#import "PPViewController.h"

@interface PPViewController ()

@end

@implementation PPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    NSArray <NSString *>*values = @[@"1", @"2", @"3", @"4"];

    NSArray <NSString *>*valueMap = values.mapBlock(^id _Nonnull(NSString * _Nonnull element) {
        return [NSString stringWithFormat:@"Hello %@", element];
    });
    valueMap.enumerationBlock(^(NSString *  _Nonnull element, NSInteger index, NSInteger totalCount) {
        NSLog(@"==== %@, %ld, %ld", element, index, totalCount);
    });

    NSArray *greaterThan2 = [values pp_filter:^BOOL(NSString * _Nonnull element) {
        return element.intValue > 2;
    }];
    
    for (NSString *string in greaterThan2) {
        NSLog(@"==== %@", string);
    }

    NSArray *fileterAndMap = [values pp_filter:^BOOL(NSString * _Nonnull element, NSInteger index) {
        return element.integerValue > 2;
    } pp_mapWithIndex:^id _Nonnull(NSString * _Nonnull element, NSInteger index) {
        return [NSString stringWithFormat:@"Hello %@", element];
    }];
    for (NSString *string in fileterAndMap) {
        NSLog(@"==== %@", string);
    }

    PPScrollContentView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
