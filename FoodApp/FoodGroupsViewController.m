//
//  FoodGroupsViewController.m
//  FoodApp
//
//  Created by Paul Trott on 6/20/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "FoodGroupsViewController.h"
#import "FruitViewController.h"
#import "AboutViewController.h"

@interface FoodGroupsViewController ()

@end

@implementation FoodGroupsViewController

- (void)dealloc
{
    [_fruitViewController release]; _fruitViewController = nil;
    [_aboutViewController release]; _aboutViewController = nil;
    [super dealloc];
}

#pragma mark - Nib Setup

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Healthy Choices", @"Healthy Choices");
    }
    
    return self;
}

#pragma mark - Button Actions

- (IBAction)fruitButtonClick:(id)sender
{
        //--Add the view of the Fruit View controller to the current view
    if (!self.fruitViewController) {
        self.fruitViewController = [[[FruitViewController alloc] initWithNibName:@"FruitViewController" bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:self.fruitViewController animated:YES];
    
}

- (IBAction)aboutButtonClick:(id)sender
{
        //-Add thee view of the About View Controller to the current view
    if (!self.aboutViewController) {
        self.aboutViewController = [[[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:self.aboutViewController animated:YES];
    
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
