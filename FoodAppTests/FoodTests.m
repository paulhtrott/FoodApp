//
//  FoodClassTests.m
//  FoodApp
//
//  Created by Paul Trott on 6/12/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "FoodTests.h"

@implementation FoodTests

//Testing Name

- (void)testFoodNameIfEmpty
{
    Food *testFood = [[[Food alloc] init] autorelease];
    [testFood setName:@""];
    
    NSString *expectedName = @"No Name Entered";
    NSString *resultName = [testFood name];
    
    STAssertEqualObjects(expectedName, resultName, @"If name is set to an empty string, name should be 'No Name Entered'");
}

- (void)testFoodNameIfAllSpaces
{
    Food *testFood = [[[Food alloc] init] autorelease];
    [testFood setName:@"      "];
    
    NSString *expectedName = @"No Name Entered";
    NSString *resultName = [testFood name];
    
    STAssertEqualObjects(expectedName, resultName, @"If name is set to multiple spaces, name should be 'No Name Entered'");
}


- (void)testFoodNameRemoveTrailingLeadingSpacesU
{
    Food *testFood = [[[Food alloc] init] autorelease];
    [testFood setName:@" Green Lettuce "];
    
    NSString *expectedName = @"Green Lettuce";
    NSString *resultName = [testFood name];

    STAssertEqualObjects(expectedName, resultName, @"Remove leading and trailing spaces in name");
}


- (void)testFoodNameTitleCase
{
    Food *testFood = [[[Food alloc] init] autorelease];
    [testFood setName:@"GREEN LETTUCE"];
    
    NSString *expectedName = @"Green Lettuce";
    NSString *resultName = [testFood name];
    
    STAssertEqualObjects(expectedName, resultName, @"Titlecase food name");
}

    //////////////////
    //Testing Description

- (void)testFoodDescriptionIfEmpty
{
    Food *testFood = [[[Food alloc] init] autorelease];
    [testFood setDescriptionOf:@""];
    
    NSString *expectedDescription = @"No Description Entered";
    NSString *resultDescription = [testFood descriptionOf];
    
    STAssertEqualObjects(expectedDescription, resultDescription, @"If description is empty, description defaults to 'No Description Entered'");
}

- (void)testFoodDescriptionIfAllSpaces
{
    Food *testFood = [[[Food alloc] init] autorelease];
    [testFood setDescriptionOf:@"  "];
    
    NSString *expectedDescription = @"No Description Entered";
    NSString *resultDescription = [testFood descriptionOf];
    
    STAssertEqualObjects(expectedDescription, resultDescription, @"If description is all spaces, description defaults to 'No Description Entered'");
}

- (void)testFoodDescriptionRemoveLeadingAndTrailingSpaces
{
    Food *testFood = [[[Food alloc] init] autorelease];
    [testFood setDescriptionOf:@" How are you? Fine I hope. "];
    
    NSString *expectedDescription = @"How are you? Fine I hope.";
    NSString *resultDescription = [testFood descriptionOf];
    
    STAssertEqualObjects(expectedDescription, resultDescription, @"If description has leading and trailing spaces, remove them");
}


@end
