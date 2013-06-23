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
    IBOutlet UIScrollView *_scrollView;
    IBOutlet UIButton *_fruitButton;
    IBOutlet UIButton *_veggieButton;
    IBOutlet UIButton *_aboutButton;
}

@property(strong)FoodViewController *foodViewController;
@property(strong)AboutViewController *aboutViewController;
@property(strong)UIScrollView *scrollView;
@property(strong)UIButton *fruitButton;
@property(strong)UIButton *veggieButton;
@property(strong)UIButton *aboutButton;

- (IBAction)fruitButtonClick:(id)sender;
- (IBAction)aboutButtonClick:(id)sender;





@end
