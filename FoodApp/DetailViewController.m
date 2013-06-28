//
//  DetailViewController.m
//  FoodApp
//
//  Created by Paul Trott on 6/28/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)dealloc
{
    [_foodNameLabel release]; _foodNameLabel = nil;
    [_foodGroupLabel release]; _foodGroupLabel = nil;
    [_detailFood release]; _detailFood = nil;
    
    [super dealloc];
}


#pragma mark - Nib File Setup

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Nutritional Facts", @"Nutritional Facts");
    }
    
    return self;
}

#pragma mark - Set Detail Information

- (void) setDetailFood:(Food *)newDetailFood
{
    if (_detailFood != newDetailFood) {
        _detailFood = newDetailFood;
        
            //update the view
        [self configureView];
    }
}

- (void)configureView
{
        //Update the user interface for the details on item.
    if (self.detailFood) {
        
        if ([[self.detailFood name] isEqualToString:@"No Name"]) {
            self.foodNameLabel.text = @"";
        } else {
            self.foodNameLabel.text = [self.detailFood name];
        }
        
        if ([[self.detailFood foodGroup] isEqualToString:@"No Group"]) {
            self.foodGroupLabel.text = @"";
        } else {
            self.foodGroupLabel.text = [self.detailFood foodGroup];
        }
        
        
        if ([[self.detailFood foodType] isEqualToString:@"No Type"]) {
            self.foodTypeLabel.text = @"";
        } else {
            self.foodTypeLabel.text = [self.detailFood foodType];
        }
        
        
        
    }
}

#pragma mark - View Loading

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self configureView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
