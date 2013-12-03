//
//  myTry.m
//  MasterMind
//
//  Created by Tiago Paluch on 21/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "myTry.h"

@implementation myTry
- (id)init
{
    self = [super init];
    if (self) {
        _resultados = [[NSMutableArray alloc] init];
        _tentativas = [[NSMutableArray alloc] init];
        _vlExist = 0;
        _vlPlace = 0;
    }
    return self;
}
- (void)Compare {
    _vlExist = 0;
    _vlPlace = 0;
    
    for (int i = 0; i < [[self tentativas] count]; i++) {
        int subExist = 0;
        if ([[[self tentativas] objectAtIndex:i] integerValue] == [[[self resultados] objectAtIndex:i] integerValue]) {
            _vlPlace++;
        } else {
            for (int h = 0; h < [[self resultados] count]; h++) {
                if ([[[self tentativas] objectAtIndex:h] integerValue] != [[[self resultados] objectAtIndex:h] integerValue]) {
                if ([[[self tentativas] objectAtIndex:i] integerValue] == [[[self resultados] objectAtIndex:h] integerValue]) {
                    subExist++;
                }}
            }
            if (subExist>0) {
                _vlExist++;
            }
        }
    }
}
@end
