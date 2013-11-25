//
//  NewGameViewController.m
//  MasterMind
//
//  Created by Tiago Paluch on 25/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "NewGameViewController.h"
#import "Game.h"

@interface NewGameViewController ()

@end

@implementation NewGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[self tabBarItem] setTitle:@"New Game"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout: UIRectEdgeNone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)novoJogo:(id)sender {
    [[Game meuGame] newGame:[[self Difculdade] selectedRowInComponent:0]+3];
    [[self navigationController] popViewControllerAnimated:YES];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 6;
}
//uiPickerViewDelegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[NSString alloc] initWithFormat:@"%ld",row+3];
}
@end
