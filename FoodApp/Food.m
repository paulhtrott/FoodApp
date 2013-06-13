//
//  Food.m
//  FoodApp
//
//  Created by Paul Trott on 6/12/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "Food.h"

@implementation Food


- (void)setName:(NSString *) foodName
{
    NSString *trimmedFoodName = [foodName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *titleCaseName = [trimmedFoodName capitalizedString];
    
    if([trimmedFoodName length] == 0 || [trimmedFoodName isEqualToString:@""])
    {
        _name = @"No Name Entered";
    }
    else
    {
        _name = titleCaseName;
    }
}

- (void)setDescriptionOf:(NSString *) foodDescription
{
    NSString *trimmedFoodDescription = [foodDescription stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([trimmedFoodDescription length] == 0 || [trimmedFoodDescription isEqualToString:@""])
    {
        _descriptionOf = @"No Description Entered";
    }
    else
    {
        _descriptionOf = trimmedFoodDescription;
    }
}

- (void)setMeasurement:(NSString *)measurement
{
    
}







@end
