//
//  FoodGroupsViewController.m
//  FoodApp
//
//  Created by Paul Trott on 6/20/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "FoodGroupsViewController.h"

@interface FoodGroupsViewController ()

@end

@implementation FoodGroupsViewController

- (void)dealloc
{
    [_foodViewController release]; _foodViewController = nil;
    [_aboutViewController release]; _aboutViewController = nil;
    [super dealloc];
}

- (IBAction)fruitButtonClick:(id)sender
{
        //--Add the view of the Food View controller to the current view
    if (_foodViewController == nil) {
        _foodViewController = [[FoodViewController alloc] initWithNibName:@"FoodViewController" bundle:nil];
    }
    
        //-- Animate the view.
    [UIView transitionWithView:self.view
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCurlUp | UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionAllowAnimatedContent
                    animations:^{[self.view addSubview:_foodViewController.view];}
                    completion:NULL];
    
}

- (IBAction)aboutButtonClick:(id)sender
{
        //-Add thee view of the About View Controller to the current view
    if (_aboutViewController == nil) {
        _aboutViewController = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    }
    
        //--Animate the view.
    [UIView transitionWithView:self.view
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCurlUp | UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionAllowAnimatedContent
                    animations:^{[self.view addSubview:_aboutViewController.view];}
                    completion:NULL];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
