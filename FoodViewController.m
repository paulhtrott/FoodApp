//
//  FoodViewController.m
//  FoodApp
//
//  Created by Paul Trott on 6/17/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "FoodViewController.h"

@interface FoodViewController ()

@end

@implementation FoodViewController

- (IBAction)btnClicked:(id)sender
{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Hello Food"
                                                    message:@"iPhone, Here I come"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok Food"
                                          otherButtonTitles: nil] autorelease];
    [alert show];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
