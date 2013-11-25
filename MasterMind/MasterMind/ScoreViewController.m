//
//  ScoreViewController.m
//  MasterMind
//
//  Created by Tiago Paluch on 25/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "ScoreViewController.h"
#import "Game.h"
@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[self navigationItem] setTitle:@"Score MasterMind"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *pontos = [[NSString alloc] initWithFormat:@"%d tentativas!", [[[Game meuGame] trys] count]];
    [[self Score] setText:pontos];
    [self setEdgesForExtendedLayout: UIRectEdgeNone];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newGame:(id)sender {
    [[Game meuGame] newGame:[[Game meuGame] difilcudade]];
    [[self navigationController] popToRootViewControllerAnimated:YES];
}
@end
