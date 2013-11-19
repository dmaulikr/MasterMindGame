//
//  Cor.m
//  MasterMind
//
//  Created by Tiago Paluch on 19/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "Cor.h"

@implementation Cor

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
