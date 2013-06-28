//
//  FruitViewController.h
//  FoodApp
//
//  Created by Paul Trott on 6/17/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FruitViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>
{
    
    IBOutlet UITableView *_foodGroupTable;
    
}

@property(strong, nonatomic) UITableView *foodGroupTable;

@end
