//
//  FoodGroupsViewController.h
//  FoodApp
//
//  Created by Paul Trott on 6/20/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FruitViewController;
@class VegetableViewController;
@class AboutViewController;


@interface FoodGroupsViewController : UIViewController
{
    FruitViewController *_fruitViewController;
    VegetableViewController *_vegetableViewController;
    AboutViewController *_aboutViewController;
}

@property(strong)FruitViewController *fruitViewController;
@property(strong)VegetableViewController *vegetableViewController;
@property(strong)AboutViewController *aboutViewController;

- (IBAction)fruitButtonClick:(id)sender;
- (IBAction)vegetableButtonClick:(id)sender;
- (IBAction)aboutButtonClick:(id)sender;





@end
