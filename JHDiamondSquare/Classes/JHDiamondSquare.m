//
//  JHDiamondSquare.m
//
//  Copyright © 2017 Jared Halpern. All rights reserved.
//

#import "JHDiamondSquare.h"

// Initial seed value for the corners
static const CGFloat kCornerHeightValue = 1000.0f;

@implementation JHDiamondSquare

+(NSArray *)diamondSquare:(long)seed gridSize:(NSInteger)size {
    return [JHDiamondSquare diamondSquare:seed gridSize:size initialHeight:kCornerHeightValue];
}
    
+(NSArray *)diamondSquare:(long)seed gridSize:(NSInteger)size initialHeight:(CGFloat)initialHeight {

    // Convert to (2^n) + 1
    // GRID_SIZE is the length of the height and the width
    NSInteger GRID_SIZE = (1 << size) + 1;
    NSMutableArray *grid = [self zeroGrid:GRID_SIZE];
    
    // Seed the corners of the grid
    grid[0][0] = grid[0][GRID_SIZE-1] = grid[GRID_SIZE-1][0] = grid[GRID_SIZE-1][GRID_SIZE-1] = @(initialHeight);
    
    // Use for range: -halfHeightValue through +halfHeightValue
    CGFloat halfHeightValue = initialHeight / 2.0f;
    
    // deterministic seeded pseudo random number generator
    srand48(seed);

    // Take length of side and halve each iteration until >= 2.
    // In GRID_SIZE - 1: (- 1 is necessary bc using as an index into the array)
    for(NSInteger sideLength = GRID_SIZE-1; sideLength >= 2; sideLength /= 2.0f) {
        
        NSInteger halfSideLength = sideLength / 2;

        // Square step
        for (NSInteger x = 0; x < GRID_SIZE - 1; x += sideLength) {
            for (NSInteger y = 0; y < GRID_SIZE - 1; y += sideLength) {
                
                // Calculate average of existing corners
                NSInteger avgCorners = [grid[x][y] integerValue] +
                [grid[x + sideLength][y] integerValue] +
                [grid[x + sideLength][y + sideLength] integerValue] +
                [grid[x][y + sideLength] integerValue];
                
                avgCorners /= (NSInteger)4;

                // Set center to average + boxed random element
                NSInteger randomFactor = drand48() * (2 * halfHeightValue) - halfHeightValue;
                grid[x + halfSideLength][y + halfSideLength] = @(avgCorners + randomFactor);
            }
        }

        // Diamond step
        for (NSInteger x = 0; x < GRID_SIZE - 1; x += halfSideLength) {
            for (NSInteger y = (x + halfSideLength) % sideLength; y < GRID_SIZE-1; y += sideLength) {
                
                NSInteger avgDiamondCenter =
                [grid[(x - halfSideLength + GRID_SIZE - 1) % (GRID_SIZE - 1)][y] integerValue] +
                [grid[(x + halfSideLength) % (GRID_SIZE - 1)][y] integerValue] +
                [grid[x][(y + halfSideLength) % (GRID_SIZE - 1)] integerValue] +
                [grid[x][(y - halfSideLength + GRID_SIZE - 1) % (GRID_SIZE - 1)] integerValue];
                
                avgDiamondCenter /= (NSInteger)4;
                NSInteger randomFactor = drand48() * (2 * halfHeightValue) - halfHeightValue;
                grid[x][y] = @(avgDiamondCenter + randomFactor);
                
                // Wrap values on the far edges
                // ie: for 5x5 grid, set avg value for grid[(GRID_SIZE - 1)][{1, 2, 3}] and grid[{1, 2, 3}][GRID_SIZE - 1]
                if(x == 0) {
                    grid[GRID_SIZE-1][y] = @(avgDiamondCenter);
                }
                
                if(y == 0) {
                    grid[x][GRID_SIZE-1] = @(avgDiamondCenter);
                }
            }
        }
        halfHeightValue /= 2.0f;
    }
    return grid;
}

#pragma mark - Private

+ (NSMutableArray *)zeroGrid:(NSInteger)gridSize {
    
    // Return a 2D grid of provided size with NSNumber objects containing value 0.
    
    NSMutableArray *gridY = [[NSMutableArray alloc] initWithCapacity:gridSize];
    
    for (int x = 0; x < gridSize; x++) {
        gridY[x] = @(0);
    }
    
    NSMutableArray *grid = [@[]mutableCopy];
    
    for (int x = 0; x < gridSize; x++) {
        [grid insertObject:[gridY mutableCopy] atIndex:x];
    }
    return grid;
}

@end
