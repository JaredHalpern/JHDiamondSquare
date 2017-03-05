//
//  JHViewController.m
//  JHDiamondSquare
//
//  Copyright (c) 2017 Jared Halpern. All rights reserved.
//

#import "JHViewController.h"
#import <JHDiamondSquare/JHDiamondSquare.h>

@interface JHViewController ()

@end

@implementation JHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *dsMap = [JHDiamondSquare diamondSquare:1 gridSize:2];
    
    for (int x = 0; x < dsMap.count; x++) {
        for (int y= 0; y < dsMap.count; y++) {
            NSInteger value = [dsMap[x][y] integerValue];
            printf("%li        ", (long)value);
        }
        printf("\n");
    }
}

@end
