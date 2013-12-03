//
//  combinationGenerator.m
//  MemoryGame
//
//  Created by André Traleski de Campos on 11/21/13.
//  Copyright (c) 2013 André Traleski de Campos. All rights reserved.
//

#import "combinationGenerator.h"
#import "symbol.h"

@implementation combinationGenerator

+(combinationGenerator *)sharedGenerator;
{
    static combinationGenerator* sharedGenerator = nil;
    if(!sharedGenerator)
        sharedGenerator = [[super alloc] init];
    
    return sharedGenerator;
}

- (id)init
{
    self = [super init];
    if (self) {
        combination = [[NSMutableArray alloc] init];
        symbol* s1 = [[symbol alloc] initWithImg:@"symbol1.jpg" Name:@"Triangle" Index:0];
        symbol* s2 = [[symbol alloc] initWithImg:@"symbol2.jpg" Name:@"Square" Index:1];
        symbol* s3 = [[symbol alloc] initWithImg:@"symbol3.jpg" Name:@"Circle" Index:2];
        symbol* s4 = [[symbol alloc] initWithImg:@"symbol4.jpg" Name:@"Polygon" Index:3];
        symbols = @[s1,s2,s3,s4];
    }
    return self;
}

- (NSArray *)generateCombinationWithQuantity:(int)i
{
    [combination removeAllObjects];
    int x;
    for (int j = 0;j < i;j++)
    {
        int rand = arc4random() % 100;
        symbol* s;
        
        if(rand < 25)
        {
            s = [[symbol alloc] initWithImg:@"symbol1.jpg" Name:@"Triangle" Index:0];
            x = 0;
        }
        else if (rand >= 25 && rand < 50)
        {
            s = [[symbol alloc] initWithImg:@"symbol2.jpg" Name:@"Square" Index:1];
            x = 1;
        }
        else if (rand >= 50 && rand < 75)
        {
            s = [[symbol alloc] initWithImg:@"symbol3.jpg" Name:@"Circle" Index:2];
            x = 2;
        }
        else if (rand >= 75 && rand < 100)
        {
            s = [[symbol alloc] initWithImg:@"symbol4.jpg" Name:@"Polygon" Index:3];
            x = 3;
        }
    
        [combination addObject:s];
    }
    
    return combination;
}

- (NSArray *)returnSymbols
{
    return symbols;
}

-(NSArray *)returnGeneratedCombination
{
    return combination;
}
@end
