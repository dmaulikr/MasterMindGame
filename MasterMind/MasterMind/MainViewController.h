//
//  MainViewController.h
//  MemoryGame
//
//  Created by André Traleski de Campos on 11/21/13.
//  Copyright (c) 2013 André Traleski de Campos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    int points;
    float velocity;
    int wrong;
}
- (IBAction)okBt:(id)sender;
- (IBAction)startBt:(id)sender;
- (void)showComb;
- (IBAction)skipBt:(id)sender;
- (void)hideComb;
@property (weak, nonatomic) IBOutlet UIButton *startBtOut;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIButton *skipBtOut;
@property (weak, nonatomic) IBOutlet UIButton *okBtOut;
@property (weak, nonatomic) IBOutlet UILabel *gameOverLabel;

@end
