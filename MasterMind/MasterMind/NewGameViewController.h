//
//  NewGameViewController.h
//  MasterMind
//
//  Created by Tiago Paluch on 25/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewGameViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

- (IBAction)novoJogo:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *Difculdade;

@end
