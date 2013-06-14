//
//  Food.h
//  FoodApp
//
//  Created by Paul Trott on 6/12/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject
{
    NSString *_foodGroup;
    NSString *_name;
    NSString *_descriptionOf;
    NSInteger _calories;
    NSInteger _caloriesFromFat;
    double _servingSize;
    NSString *_measurement;
    double _carbs;
    double _fat;
    double _protein;
    NSString *_foodType;
    UIImage *_imgLocation;
    NSString *_healthBenefits;
    NSString *_healthRisks;
}

@property(nonatomic, strong) NSString *foodGroup;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *descriptionOf;
@property(nonatomic, assign) NSInteger calories;
@property(nonatomic, assign) NSInteger caloriesFromFat;
@property(nonatomic, assign) double servingSize;
@property(nonatomic, strong) NSString *measurement;
@property(nonatomic, assign) double carbs;
@property(nonatomic, assign) double fat;
@property(nonatomic, assign) double protein;
@property(nonatomic, strong) NSString *foodType;
@property(strong) UIImage *imgLocation;
@property(strong) NSString *healthBenefits;
@property(strong) NSString *healthRisks;


@end