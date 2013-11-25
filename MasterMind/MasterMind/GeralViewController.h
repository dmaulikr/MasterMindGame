//
//  GeralViewController.h
//  MasterMind
//
//  Created by Tiago Paluch on 21/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeralViewController : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource>
//@property (nonatomic,strong) UIView* Header;
@property (strong, nonatomic) IBOutlet UIView *headerView;
- (IBAction)okClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *footer;
@end
