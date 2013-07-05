//
//  DetailViewController.h
//  FoodApp
//
//  Created by Paul Trott on 6/28/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *_foodNameLabel;
    IBOutlet UILabel *_foodGroupLabel;
    IBOutlet UILabel *_foodTypeLabel;
    IBOutlet UILabel *_foodServingSizeLabel;
    IBOutlet UILabel *_foodCaloriesLabel;
    IBOutlet UILabel *_foodCaloriesFromFatLabel;
    IBOutlet UILabel *_foodCarbsLabel;
    IBOutlet UILabel *_foodProteinLabel;
    IBOutlet UILabel *_foodFatLabel;
    
    IBOutlet UITextView *_foodDescription;
    IBOutlet UITextView *_foodHealthBenefits;
    IBOutlet UITextView *_foodHealthRisks;
    
    IBOutlet UIScrollView *_scrollView;
    
    Food *_detailFood;
}

@property (strong, nonatomic) UILabel *foodNameLabel;
@property (strong, nonatomic) UILabel *foodGroupLabel;
@property (strong, nonatomic) UILabel *foodTypeLabel;
@property (strong, nonatomic) UILabel *foodServingSizeLabel;
@property (strong, nonatomic) UILabel *foodCaloriesLabel;
@property (strong, nonatomic) UILabel *foodCaloriesFromFatLabel;
@property (strong, nonatomic) UILabel *foodCarbsLabel;
@property (strong, nonatomic) UILabel *foodProteinLabel;
@property (strong, nonatomic) UILabel *foodFatLabel;

@property (strong, nonatomic) UITextView *foodDescription;
@property (strong, nonatomic) UITextView *foodHealthBenefits;
@property (strong, nonatomic) UITextView *foodHealthRisks;

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) Food *detailFood;


@end
