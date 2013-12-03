//
//  combinationGenerator.h
//  MemoryGame
//
//  Created by André Traleski de Campos on 11/21/13.
//  Copyright (c) 2013 André Traleski de Campos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface combinationGenerator : NSObject
{
    NSMutableArray* combination;
    NSArray* symbols;
}

+(combinationGenerator*)sharedGenerator;

-(NSArray*)generateCombinationWithQuantity:(int)i;
-(NSArray*)returnSymbols;
-(NSArray*)returnGeneratedCombination;
@end
