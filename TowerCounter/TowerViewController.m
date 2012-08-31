//
//  TowerViewController.m
//  TowerCounter
//
//  Created by Елена on 27.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TowerViewController.h"

@implementation TowerViewController

@synthesize towerTableView;

- (void)viewDidLoad{
    
    [[NSNotificationCenter defaultCenter]	
     addObserver: self
     selector: @selector(newTower:)
     name: @"newTower"
     object: nil];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [towerTableView reloadData];
}

- (IBAction)clearButton:(id)sender{
    NSLog(@"clearButton");
    [[NSNotificationCenter defaultCenter] postNotificationName: @"clearTowerArray" object:  nil];
    [towerTableView reloadData];
}
- (IBAction)refreshButton:(id)sender{
    NSLog(@"refreshButton");
    [towerTableView reloadData];

}

- (void)newTower:(NSNotification *)notification{
   
    towerArray = notification.object;
    [towerTableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section

{
    return @"";
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    if ([towerArray count]>1) 
        return  [towerArray count];
    else return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"tower";
    NSLog(@"%i", [indexPath row]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.font = cell.detailTextLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:14];

    
    if ([towerArray count] == 0) {
        cell.textLabel.text = @"нет данных";
        return cell;
    }
    else {
        for (NSInteger i=0; i<=[indexPath row]; i++) {
            NSDictionary *towerDict = [towerArray objectAtIndex:i];
           
            cell.textLabel.text = [towerDict objectForKey:@"date"];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", [towerDict objectForKey:@"longitude"], [towerDict objectForKey:@"latitude"]];
            return cell;
        }
    }
    
    return nil;
}




@end
