//
//  MainViewController.m
//  MemoryGame
//
//  Created by André Traleski de Campos on 11/21/13.
//  Copyright (c) 2013 André Traleski de Campos. All rights reserved.
//

#import "MainViewController.h"
#import "combinationGenerator.h"
#import "symbol.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        points = 0;
        velocity = 2.5;
        wrong = 0;
        [self setTitle:@"MemoryGame"];
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self gameOverLabel] setHidden:YES];
    self.skipBtOut.enabled = NO;
    self.okBtOut.enabled = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPicker Info
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}

/*
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    symbol* s = [[[combinationGenerator sharedGenerator] returnSymbols] objectAtIndex:row];
    return s.symbolName;
}
*/

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    symbol* s = [[[combinationGenerator sharedGenerator] returnSymbols] objectAtIndex:row];
    UIImageView* imgV = [[UIImageView alloc] initWithImage:s.img];
    return imgV;
}

- (IBAction)okBt:(id)sender
{
    NSArray* verify = [[combinationGenerator sharedGenerator] returnGeneratedCombination];
    if([[verify objectAtIndex:0] index] == [[self picker] selectedRowInComponent:0] && [[verify objectAtIndex:1] index] == [[self picker] selectedRowInComponent:1] && [[verify objectAtIndex:2] index] == [[self picker] selectedRowInComponent:2] && [[verify objectAtIndex:3] index] == [[self picker] selectedRowInComponent:3])
    {
        points += 10;
        if (velocity > 0.5)
            velocity -= 0.1;
        [[self pointsLabel] setText:[NSString stringWithFormat:@"%d",points]];
        [self showComb];
        wrong = 0;
    }
    else
    {
        wrong ++;
        if (wrong >= 3)
        {
            points = 0;
            [[self pointsLabel] setText:[NSString stringWithFormat:@"%d",points]];
            self.okBtOut.enabled = NO;
            self.skipBtOut.enabled = NO;
            [[self startBtOut] setHidden:NO];
            [[self gameOverLabel] setHidden:NO];
        }
    }
}

- (IBAction)startBt:(id)sender
{
    [[self startBtOut] setHidden:YES];
    wrong = 0;
    [[self gameOverLabel] setHidden:YES];
    self.skipBtOut.enabled = YES;
    self.okBtOut.enabled = YES;
    [self showComb];
}

- (void)showComb
{
    NSArray* rando = [[combinationGenerator sharedGenerator] generateCombinationWithQuantity:4];
    int i = 1;
    int x = 150;
    int y = self.view.window.bounds.size.height/2;
    symbol* s;
    CGRect rect= CGRectMake(x*i, y, 50, 50);
    
    s = [rando objectAtIndex:0];
    [s.imgView setFrame:rect];
    [self.view addSubview:[[rando objectAtIndex:0] imgView]];
    
    i++;
    rect= CGRectMake(x*i, y, 50, 50);
    s = [rando objectAtIndex:1];
    [s.imgView setFrame:rect];
    [self.view addSubview:[[rando objectAtIndex:1] imgView]];
    
    i++;
    rect= CGRectMake(x*i, y, 50, 50);
    s = [rando objectAtIndex:2];
    [s.imgView setFrame:rect];
    [self.view addSubview:[[rando objectAtIndex:2] imgView]];
    
    i++;
    rect= CGRectMake(x*i, y, 50, 50);
    s = [rando objectAtIndex:3];
    [s.imgView setFrame:rect];
    [self.view addSubview:[[rando objectAtIndex:3] imgView]];
    [NSTimer scheduledTimerWithTimeInterval:velocity
                                     target:self
                                   selector:@selector(hideComb)
                                   userInfo:nil
                                    repeats:NO];
}

- (IBAction)skipBt:(id)sender
{
    points-=10;
    [[self pointsLabel] setText:[NSString stringWithFormat:@"%d",points]];
    [self showComb];
}

- (void)hideComb
{
    for(UIView* v in self.view.subviews)
    {
        if (v.frame.origin.y == self.view.window.bounds.size.height/2)
            [v removeFromSuperview];
    }
}
@end
