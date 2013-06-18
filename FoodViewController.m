//
//  FoodViewController.m
//  FoodApp
//
//  Created by Paul Trott on 6/17/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "FoodViewController.h"
#import "Fruit.h"

@interface FoodViewController ()

@end

@implementation FoodViewController


- (IBAction)btnClicked:(id)sender
{
    UIActionSheet *action = [[[UIActionSheet alloc] initWithTitle:_txtFoodTitle.text
                                                         delegate:self
                                                cancelButtonTitle:@"OKAY"
                                           destructiveButtonTitle:@"Delete Message"
                                                otherButtonTitles:@"Option 1", @"Option 2", nil] autorelease];
    
    [action showInView:self.view];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
        //--Sample of a fruit object
    Food *fruit = [[[Fruit alloc] init] autorelease];
    fruit.name = @"Macintosh Apple";
    fruit.calories = 12;
    fruit.caloriesFromFat = 10;
    fruit.carbs = 50;
    fruit.protein = 0;
    fruit.fat = 12;
    fruit.foodGroup = @"Fruit";
    fruit.foodType = @"Sweet";
    fruit.descriptionOf = @"Best fruit on the planet";
    fruit.healthBenefits = @"Promotes healthy teeth";
    fruit.healthRisks = @"Seeds can contain trace arsnic particles";
    fruit.servingSize = 1;
    fruit.measurement = @"apple";
    
        //--apply Fruit name to label test.
    _txtFoodTitle.text = fruit.name;
    
    
    [super viewDidLoad];
    
}


- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
     NSString *btnMessage = [[[NSString alloc] initWithFormat:@"You clicked button at index %d", buttonIndex] autorelease];
    if (buttonIndex == 1)
    {
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"BTN1 Clicked"
                                                         message:btnMessage
                                                        delegate:self
                                               cancelButtonTitle:@"Click"
                                               otherButtonTitles:nil] autorelease];
        [alert show];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_txtFoodName release]; _txtFoodName = nil;
    [_txtFoodTitle release]; _txtFoodTitle = nil;
    [super dealloc];
}

@end
