//
//  FoodViewController.h
//  FoodApp
//
//  Created by Paul Trott on 6/17/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>
{
    IBOutlet UITableView *_foodGroupTable;
    NSArray *_foodGroups;
}

@property(strong) UITableView *foodGroupTable;
@property(strong) NSArray *foodGroups;


@end
