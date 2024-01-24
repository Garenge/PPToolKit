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

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSArray <NSString *>*values = @[@"1", @"2", @"3", @"4"];
//    values.mapBlock(^id _Nonnull(NSString *  _Nonnull element) {
//        return element;
//    });
    NSArray *greaterThan2 = [values pp_filter:^BOOL(NSString * _Nonnull element) {
        return element.intValue > 2;
    }];
    
    for (NSString *string in greaterThan2) {
        NSLog(@"==== %@", string);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
