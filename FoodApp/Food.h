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
    
}

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *descriptionOf;
@property(assign) NSInteger calories;
@property(assign) NSInteger caloriesFromFat;
@property(assign) double servingSize;
@property(nonatomic, strong) NSString *measurement;
@property(assign) double carbs;
@property(assign) double fat;
@property(assign) double protein;
@property(strong) NSString *foodGroup;
@property(strong) NSString *imgLocation;
@property(strong) NSString *healthBenefits;
@property(strong) NSString *healthRisks;


@end