//
//  symbol.m
//  MemoryGame
//
//  Created by André Traleski de Campos on 11/21/13.
//  Copyright (c) 2013 André Traleski de Campos. All rights reserved.
//

#import "symbol.h"

@implementation symbol

- (id)init
{
    return [self initWithImg:@"Error.jpg" Name:@"Error" Index:0];
}

- (id)initWithImg:(NSString *)i Name:(NSString *)n Index:(int)ind
{
    self = [super init];
    if (self) {
        _imgName = i;
        _img = [UIImage imageNamed:_imgName];
        _symbolName = n;
        _imgView = [[UIImageView alloc] initWithImage:_img];
        _index = ind;
    }
    return self;
}

@end
