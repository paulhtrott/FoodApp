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
    
    Food *_detailFood;
}

@property (strong, nonatomic) UILabel *foodNameLabel;
@property (strong, nonatomic) UILabel *foodGroupLabel;
@property (strong, nonatomic) UILabel *foodTypeLabel;

@property (strong, nonatomic) Food *detailFood;


@end
