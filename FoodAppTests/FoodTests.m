//
//  FoodClassTests.m
//  FoodApp
//
//  Created by Paul Trott on 6/12/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Food.h"

@interface FoodTests : SenTestCase
@end


@implementation FoodTests

Food *testFood;

-(void)setUp
{
    [super setUp];
    testFood = [[[Food alloc] init] retain];
}

-(void)tearDown
{
    [testFood release];
    [super tearDown];
}

    //////////////////////////////////////
    //Testing init function override

- (void)testInitFunctionOverrideDefaultValuesForFood
{
    STAssertEqualObjects([testFood foodGroup], @"No Group", @"Default group should be No Group");
    STAssertEqualObjects([testFood name], @"No Name", @"Default name should be No Name");
    STAssertEqualObjects([testFood descriptionOf], @"No Description", @"Default description should be No Description");
    STAssertEquals([testFood calories], 0, @"Default calories should be 0");
    STAssertEquals([testFood caloriesFromFat], 0, @"Default caloriesFromFat should be 0");
    STAssertEquals([testFood servingSize], 0.00, @"Default servingSize should be 0.00");
    STAssertEqualObjects([testFood measurement], @"No Measurement", @"Default measurement should be No Measurement");
    STAssertEquals([testFood carbs], 0.00, @"Default carbs should be 0.00");
    STAssertEquals([testFood fat], 0.00, @"Default fat should be 0.00");
    STAssertEquals([testFood protein], 0.00, @"Default protein should be 0.00");
    STAssertEqualObjects([testFood foodType], @"No Type", @"Default foodType should be No Type");
    STAssertEqualObjects([testFood healthBenefits], @"No Health Benefits", @"Default healthBenefits should be No Health Benefits");
    STAssertEqualObjects([testFood healthRisks], @"No Health Risks", @"Default healthRisks should be No Health Risks");
}

    ////////////////////////
    //Testing Name

- (void)testFoodNameIfEmpty
{
    [testFood setName:@""];
    
    STAssertEqualObjects([testFood name], @"No Name", @"If name is set to an empty string, name should be 'No Name'");
}

- (void)testFoodNameIfAllSpacesAndRemoveNewLines
{
    [testFood setName:@"      \t\n"];
    
    STAssertEqualObjects([testFood name], @"No Name", @"If name is set to multiple spaces, name should be 'No Name'");
}


- (void)testFoodNameRemoveTrailingLeadingSpacesU
{
    [testFood setName:@" Green Lettuce "];

    STAssertEqualObjects([testFood name], @"Green Lettuce", @"Remove leading and trailing spaces in name");
}


- (void)testFoodNameTitleCase
{
    [testFood setName:@"GREEN LETTUCE"];
    
    STAssertEqualObjects([testFood name], @"Green Lettuce", @"Titlecase food name");
}

    //////////////////
    //Testing Description

- (void)testFoodDescriptionIfEmpty
{
    [testFood setDescriptionOf:@""];
    
    STAssertEqualObjects([testFood descriptionOf], @"No Description", @"If description is empty, description defaults to 'No Description'");
}

- (void)testFoodDescriptionIfAllSpaces
{
    [testFood setDescriptionOf:@"  \t"];
    
    STAssertEqualObjects([testFood descriptionOf], @"No Description", @"If description is all spaces, description defaults to 'No Description'");
}

- (void)testFoodDescriptionRemoveLeadingAndTrailingSpaces
{
    [testFood setDescriptionOf:@" How are you? Fine I hope. "];
    
    STAssertEqualObjects([testFood descriptionOf], @"How are you? Fine I hope.", @"If description has leading and trailing spaces, remove them");
}

    /////////////////
    //Testing Integers and Doubles Are Not Less Than 0 (non-negative)
- (void)testFoodServingSizeEqualsEntry
{
    [testFood setServingSize:1.00];
    STAssertEquals([testFood servingSize], 1.00, @"If number is entered with a correct value, the entered value is stored");
}

- (void)testFoodServingSizeNotLessThanZero
{
    [testFood setServingSize:-2];
    STAssertEquals([testFood servingSize], 0.00, @"If serving size is less then 0, it will default to 0.");
}

- (void)testFoodCaloriesNotLessThanZero
{
    [testFood setCalories: -3];
    STAssertEquals([testFood calories], 0, @"If calories is less than 0, it will default to 0");
}

- (void)testFoodCaloriesFromFatNotLessThanZero
{
    [testFood setCaloriesFromFat:-4];
    STAssertEquals([testFood caloriesFromFat], 0, @"If caloriesFromFat is less than 0, it will default to 0");
}

- (void)testFoodCarbsNotLessThanZero
{
    [testFood setCarbs:-3];
    STAssertEquals([testFood carbs], 0.00, @"If carbs is less than 0, it will default to 0");
}

- (void)testFatNotLessThanZero
{
    [testFood setFat:-5];
    STAssertEquals([testFood fat], 0.00, @"If fat is less than 0, it will default to 0");
}

- (void)testProteinNotLessThanZero
{
    [testFood setProtein:-3];
    STAssertEquals([testFood protein], 0.00, @"If protein is less than 0, it will default to 0");
}

    ////////////
    //Testing foodType

- (void)testFoodTypeIfEmpty
{
    [testFood setFoodType:@""];
    
    STAssertEqualObjects([testFood foodType], @"No Type", @"If foodType is set to an empty string, foodType should be 'No Name'");
}

- (void)testFoodTypeIfAllSpacesAndRemoveNewLines
{
    [testFood setFoodType:@"      \t\n"];
    
    STAssertEqualObjects([testFood foodType], @"No Type", @"If foodType is set to multiple spaces, foodType should be 'No Name'");
}


- (void)testFoodTypeRemoveTrailingLeadingSpacesU
{
    [testFood setFoodType:@" Super Sweet "];
    
    STAssertEqualObjects([testFood foodType], @"Super Sweet", @"Remove leading and trailing spaces in foodType");
}


- (void)testFoodTypeTitleCase
{
    [testFood setFoodType:@"SUPER SWEET"];
    
    STAssertEqualObjects([testFood foodType], @"Super Sweet", @"Titlecase foodType");
}





@end
