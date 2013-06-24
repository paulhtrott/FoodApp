//
//  Food.m
//  FoodApp
//
//  Created by Paul Trott on 6/12/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "Food.h"

@implementation Food

- (id) init{
    self = [super init];
    
    self.foodGroup = @"No Group";
    self.name = @"No Name";
    self.descriptionOf = @"No Description";
    self.calories = 0;
    self.caloriesFromFat = 0;
    self.servingSize = 0.00;
    self.measurement = @"No Measurement"; 
    self.carbs = 0.00;
    self.fat = 0.00;
    self.protein = 0.00;
    self.foodType = @"No Type";
    self.healthBenefits = @"No Health Benefits";
    self.healthRisks = @"No Health Risks";
    
    return self;
}

- (void)setName:(NSString *) foodName
{
    if(_name != foodName)
    {
        NSString *trimmedFoodName = [self removeNewLineAndWhiteSpaceFromNSString:foodName];
        NSString *titleCaseName = [trimmedFoodName capitalizedString];
        
        [_name release];
        
        if([trimmedFoodName length] == 0 || [trimmedFoodName isEqualToString:@""])
        {
            _name = @"No Name";
        }
        else
        {
            _name = titleCaseName;
        }
        
        [_name retain];
    }
    
}

- (void)setDescriptionOf:(NSString *) foodDescription
{
    if(_descriptionOf != foodDescription)
    {
        NSString *trimmedFoodDescription = [self removeWhiteSpaceFromNSString:foodDescription];
        
        [_descriptionOf release];
        
        if ([trimmedFoodDescription length] == 0 || [trimmedFoodDescription isEqualToString:@""])
        {
            _descriptionOf = @"No Description";
        }
        else
        {
            _descriptionOf = trimmedFoodDescription;
        }
        
        [_descriptionOf retain];
    }
    
}

- (void)setCalories:(NSInteger)calories
{
    if (calories < 0)
    {
        _calories = 0;
    }
    else
    {
        _calories = calories;
    }
}

- (void)setCaloriesFromFat:(NSInteger)caloriesFromFat
{
    if (caloriesFromFat < 0)
    {
        _caloriesFromFat = 0;
    }
    else
    {
        _caloriesFromFat = caloriesFromFat;
    }
}

- (void)setServingSize:(double)servingSize
{
    if (servingSize < 0.00)
    {
        _servingSize = 0.00;
    }
    else
    {
        _servingSize = servingSize;
    }
}

- (void)setCarbs:(double)carbs
{
    if (carbs < 0)
    {
        _carbs = 0.00;
    }
    else
    {
        _carbs = carbs;
    }
}

- (void)setFat:(double)fat
{
    if (fat < 0)
    {
        _fat = 0;
    }
    else
    {
        _fat = fat;
    }
}

- (void)setProtein:(double)protein
{
    if (protein < 0)
    {
        _protein = 0.00;
    }
    else
    {
        _protein = protein;
    }
}

- (void)setFoodType:(NSString *)foodType
{
    if(_foodType != foodType)
    {
        NSString *trimmedFoodType = [self removeNewLineAndWhiteSpaceFromNSString:foodType];
        NSString *titleCaseFoodType = [trimmedFoodType capitalizedString];
        
        [_foodType release];
        
        if([trimmedFoodType length] == 0 || [trimmedFoodType isEqualToString:@""])
        {
            _foodType = @"No Type";
        }
        else
        {
            _foodType = titleCaseFoodType;
        }
        
        [_foodType retain];
    }
    
}


    //TODO - FINISH ALL TESTING AFTER FOODTYPE


- (NSString *)removeNewLineAndWhiteSpaceFromNSString:(NSString *)line
{
    NSString *noNewlineLine = [line stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *noWhiteSpaceLine = [noNewlineLine stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return noWhiteSpaceLine;
}

- (NSString *)removeWhiteSpaceFromNSString:(NSString *)lineOfText
{
    NSString *newLine = [lineOfText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return newLine;
}


- (void)dealloc
{
    [_foodGroup release]; _foodGroup = nil;
    
    [_name release]; _name = nil;
    
    [_descriptionOf release]; _descriptionOf = nil;
    
    [_measurement release]; _measurement = nil;
    
    [_imgLocation release]; _imgLocation = nil;
    
    [_foodType release]; _foodType = nil;
    
    [_healthBenefits release]; _healthBenefits = nil;
    
    [_healthRisks release]; _healthRisks = nil;
    
    [super dealloc];
}


@end
