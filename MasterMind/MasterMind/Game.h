//
//  Game.h
//  MasterMind
//
//  Created by Tiago Paluch on 21/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class myTry;

@interface Game : NSObject
@property (strong,nonatomic) NSMutableArray* trys;
@property (strong,nonatomic) NSMutableArray* resultado;
@property (strong,nonatomic) NSMutableArray* cores;

@property int difilcudade;
@property BOOL  gameOver;

+ (Game*)meuGame;
- (void) addTentativa:(myTry*)tentativa;
- (void) newGame:(int)nd;

@end
