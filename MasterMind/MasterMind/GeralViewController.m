//
//  GeralViewController.m
//  MasterMind
//
//  Created by Tiago Paluch on 21/11/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "GeralViewController.h"
#import "Game.h"
#import "myTry.h"
#import "ScoreViewController.h"
#import "NewGameViewController.h"

@interface GeralViewController ()

@end

@implementation GeralViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [[self tableView] setTableHeaderView:[self headerView]];
        [[self footer] setDelegate:self];
        [[self footer] setDataSource:self];
        [[self navigationItem] setTitle:@"MasterMind"];
        
        
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"Novo Jogo" style:UIBarButtonItemStyleBordered target:self action:@selector(nGame:)];
        [[self navigationItem] setRightBarButtonItem:bbi animated:YES];
        
        
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated {
    [[self tableView] reloadData];
    [[self footer] reloadAllComponents];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(IBAction)nGame:(id)sender {
    NewGameViewController *gvc = [[NewGameViewController alloc] init];
    [[self navigationController] pushViewController:gvc animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[Game meuGame] trys] count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    long realLinha = [[[Game meuGame] trys] count] - indexPath.row -1;
    
    myTry *t = [[[Game meuGame] trys] objectAtIndex:realLinha];
    
    for (int i = 0; i < [[t tentativas] count]; i++) {
        UIView *u = [[UIView alloc] initWithFrame:CGRectMake(i*50, 0, 40, 40)];
        NSNumber *x = [[t tentativas] objectAtIndex:i];
        UIColor *mt = [[[Game meuGame] cores] objectAtIndex:[x integerValue]];
        [u setBackgroundColor:mt];
        [cell addSubview:u];
    }
    for (int g = 0; g < [t vlPlace]; g++) {
        CGRect re = CGRectMake((50*[[t tentativas] count])+100+(g*50), 10, 20, 20);
        UIView *h = [[UIView alloc] initWithFrame:re];
        [h setBackgroundColor:[UIColor greenColor]];
        [cell addSubview:h];
    }
    for (int g = 0; g < [t vlExist]; g++) {
        CGRect re = CGRectMake((50*([[t tentativas] count]+[t vlPlace]))+100+(g*50), 10, 20, 20);
        UIView *h = [[UIView alloc] initWithFrame:re];
        [h setBackgroundColor:[UIColor redColor]];
        [cell addSubview:h];
    }
    NSString *s = [[NSString alloc] initWithFormat:@"%d",[t vlExist]];
    NSString *d = [[NSString alloc] initWithFormat:@"%d",[t vlPlace]];
    [[cell textLabel] setText:s];
    [[cell detailTextLabel] setText:d];
    return cell;
}


- (UIView*) headerView {
    if (!_headerView)
        [[NSBundle mainBundle] loadNibNamed:@"Entrada" owner:self options:nil];
    return _headerView;

}

- (IBAction)okClick:(id)sender {
    
    if ([[Game meuGame] gameOver]) {
        ScoreViewController *svc = [[ScoreViewController alloc] init];
        [[self navigationController] pushViewController:svc animated:YES];
    } else {
    
    NSMutableArray *arTemp = [[NSMutableArray alloc] init];
    for (int i = 0; i < [[Game meuGame] difilcudade]; i++) {
        NSNumber *n = [[NSNumber alloc] initWithInt:[[self footer] selectedRowInComponent:i]];
        [arTemp addObject:n];
    }
    myTry *t = [[myTry alloc] init];
    [t setTentativas:arTemp];
    [[Game meuGame] addTentativa:t];
    NSLog(@"%d",[t vlPlace]);
    
    
    if ([[Game meuGame] gameOver]) {
        ScoreViewController *svc = [[ScoreViewController alloc] init];
        [[self navigationController] pushViewController:svc animated:YES];
    }
    
    [[self tableView] reloadData];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [[Game meuGame] difilcudade];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[[Game meuGame] cores] count];
}
//uiPickerViewDelegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIColor *mt = [[[Game meuGame] cores] objectAtIndex:row];
    UIView *mvi = [[UIView alloc] init];
    [mvi setBackgroundColor:mt];
    return mvi;
}



@end
