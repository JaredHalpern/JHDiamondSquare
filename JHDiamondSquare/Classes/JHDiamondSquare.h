//
//  JHDiamondSquare.h
//
//  Copyright © 2017 Jared Halpern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHDiamondSquare : NSObject

+(NSArray *)diamondSquare:(long)seed gridSize:(NSInteger)gridSize;
+(NSArray *)diamondSquare:(long)seed gridSize:(NSInteger)size initialHeight:(CGFloat)initialHeight;

@end
