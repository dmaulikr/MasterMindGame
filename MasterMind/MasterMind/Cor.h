//
//  Cor.h
//  MasterMind
//
//  Created by Tiago Paluch on 19/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cor : UIView
@property (nonatomic,strong) UIColor* color;
@property int valor;

-(id)initWithFrame:(CGRect)frame cor:(UIColor*)cor valor:(int)valor;
@end
