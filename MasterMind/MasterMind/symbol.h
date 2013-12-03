//
//  symbol.h
//  MemoryGame
//
//  Created by André Traleski de Campos on 11/21/13.
//  Copyright (c) 2013 André Traleski de Campos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface symbol : NSObject
@property UIImage* img;
@property UIImageView* imgView;
@property NSString* imgName;
@property NSString* symbolName;
@property int index;

- (id)initWithImg:(NSString*)i Name:(NSString*)n Index:(int)ind;
@end
