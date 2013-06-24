//
//  FoodGroupsViewController.h
//  FoodApp
//
//  Created by Paul Trott on 6/20/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodViewController.h"
#import "AboutViewController.h"

@interface FoodGroupsViewController : UIViewController
{
    FoodViewController *_foodViewController;
    AboutViewController *_aboutViewController;
}

@property(strong)FoodViewController *foodViewController;
@property(strong)AboutViewController *aboutViewController;

- (IBAction)fruitButtonClick:(id)sender;
- (IBAction)aboutButtonClick:(id)sender;





@end
