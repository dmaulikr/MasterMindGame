//
//  myTry.h
//  MasterMind
//
//  Created by Tiago Paluch on 21/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myTry : NSObject
@property (strong,nonatomic) NSMutableArray* tentativas;
@property (strong,nonatomic) NSMutableArray* resultados;
@property int vlExist;
@property int vlPlace;

- (void)Compare;
@end
