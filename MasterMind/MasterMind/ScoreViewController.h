//
//  ScoreViewController.h
//  MasterMind
//
//  Created by Tiago Paluch on 25/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *Score;
- (IBAction)newGame:(id)sender;

@end
