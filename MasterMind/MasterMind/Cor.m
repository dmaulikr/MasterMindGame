//
//  Cor.m
//  MasterMind
//
//  Created by Tiago Paluch on 19/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "Cor.h"

@implementation Cor

- (id)initWithFrame:(CGRect)frame cor:(UIColor*)cor valor:(int)valor;

{
    self = [super initWithFrame:frame];
    if (self) {
        [self setColor:cor];
        [self setValor:valor];
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
    CGContextRef ct = UIGraphicsGetCurrentContext();
    [self setBackgroundColor:[self color]];
    CGContextStrokePath(ct);
}

@end
