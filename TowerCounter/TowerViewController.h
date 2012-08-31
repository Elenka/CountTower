//
//  TowerViewController.h
//  TowerCounter
//
//  Created by Елена on 27.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TowerViewController : UITableViewController <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>{
   
    NSMutableArray *towerArray;
    IBOutlet UITableView *towerTableView;
}

- (IBAction)clearButton:(id)sender;
- (IBAction)refreshButton:(id)sender;

@property (nonatomic) UITableView *towerTableView;

@end
