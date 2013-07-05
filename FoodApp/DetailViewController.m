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
    [_foodTypeLabel release]; _foodTypeLabel = nil;
    [_foodServingSizeLabel release]; _foodServingSizeLabel = nil;
    [_foodCaloriesLabel release]; _foodCaloriesLabel = nil;
    [_foodCaloriesFromFatLabel release]; _foodCaloriesFromFatLabel = nil;
    [_foodCarbsLabel release]; _foodCarbsLabel = nil;
    [_foodProteinLabel release]; _foodProteinLabel = nil;
    [_foodFatLabel release]; _foodFatLabel = nil;
    
    [_foodDescription release]; _foodDescription = nil;
    [_foodHealthBenefits release]; _foodHealthBenefits = nil;
    [_foodHealthRisks release]; _foodHealthRisks = nil;
    
    [_scrollView release]; _scrollView = nil;
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
        
        if ([[self.detailFood measurement] isEqualToString:@"No Measurement"]) {
            self.foodServingSizeLabel.text = [NSString stringWithFormat:@"%.2f", [self.detailFood servingSize]];
        } else {
            self.foodServingSizeLabel.text = [NSString stringWithFormat:@"%.2f %@", [self.detailFood servingSize], [self.detailFood measurement]];
        }
        
        self.foodCaloriesLabel.text = [NSString stringWithFormat:@"%i",[self.detailFood calories]];
        self.foodCaloriesFromFatLabel.text = [NSString stringWithFormat:@"%i", [self.detailFood caloriesFromFat]];
        self.foodCarbsLabel.text = [NSString stringWithFormat:@"%.2fg", [self.detailFood carbs]];
        self.foodProteinLabel.text = [NSString stringWithFormat:@"%.2fg", [self.detailFood protein]];
        self.foodFatLabel.text = [NSString stringWithFormat:@"%.2fg", [self.detailFood fat]];
        self.foodDescription.text = [self.detailFood descriptionOf];
        self.foodHealthBenefits.text = [self.detailFood healthBenefits];
        self.foodHealthRisks.text = [self.detailFood healthRisks];
        
    }
    
}

#pragma mark - View Loading

- (void)viewDidLoad
{
    _scrollView = [[[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat contentWidth = screenRect.size.width;
    CGFloat contentHeight = screenRect.size.height;
    
    _scrollView.contentSize = CGSizeMake(contentWidth, contentHeight);
    
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
