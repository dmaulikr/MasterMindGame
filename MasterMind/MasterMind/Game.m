//
//  Game.m
//  MasterMind
//
//  Created by Tiago Paluch on 21/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "Game.h"
#import "myTry.h"

@implementation Game

- (id)init
{
    self = [super init];
    if (self) {
        _trys = [[NSMutableArray alloc] init];
        _resultado = [[NSMutableArray alloc] init];
        _cores = [[NSMutableArray alloc] init];
        _difilcudade = 5;
        
        
        //popular biblioteca de views
        
        [[self cores] addObject:[UIColor redColor]];
        [[self cores] addObject:[UIColor blueColor]];
        [[self cores] addObject:[UIColor greenColor]];
        [[self cores] addObject:[UIColor yellowColor]];
        [[self cores] addObject:[UIColor purpleColor]];
        [[self cores] addObject:[UIColor grayColor]];
        [[self cores] addObject:[UIColor orangeColor]];
        [[self cores] addObject:[UIColor cyanColor]];
        [[self cores] addObject:[UIColor magentaColor]];
        [[self cores] addObject:[UIColor blackColor]];
        
        
        [self newGame:_difilcudade];
    }
    return self;
}

+ (Game *)meuGame {
    static Game* meuGame = nil;
    if (!meuGame)
        meuGame = [[super alloc] init];
    
    return meuGame;
}
- (void)addTentativa:(myTry *)tentativa {
    [tentativa setResultados:[self resultado]];
    [tentativa Compare];
    [[self trys] addObject:tentativa];
    
    if ([tentativa vlPlace] == [self difilcudade]) {
        [self setGameOver:YES];
    }
    
}
- (void)newGame:(int)nd {
    _difilcudade = nd;
    _gameOver = false;
    [[self trys] removeAllObjects];
    [[self resultado] removeAllObjects];
    
    for (int i = 0; i < [self difilcudade]; i++) {
        NSNumber *h = [[NSNumber alloc] initWithLong: arc4random_uniform([[self cores] count])];
        [[self resultado] addObject:h];
    }
    NSLog(@"%@",[self resultado]);
}
@end
