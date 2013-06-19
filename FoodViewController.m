//
//  FoodViewController.m
//  FoodApp
//
//  Created by Paul Trott on 6/17/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "FoodViewController.h"
#import "Fruit.h"
#import "Vegetable.h"

@interface FoodViewController ()

@end

@implementation FoodViewController

- (void)dealloc
{
    [_foodGroups release]; _foodGroups = nil;
    [_foodGroupTable release]; _foodGroupTable = nil;
    
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"FoodGroups Array Count: %d", [_foodGroups count]);
    
    return [_foodGroups count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *_foodGroupCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!_foodGroupCell) {
        _foodGroupCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil] autorelease];
    }
    
    _foodGroupCell.textLabel.text = [[_foodGroups objectAtIndex:indexPath.row] foodGroup];
    _foodGroupCell.detailTextLabel.text = [[_foodGroups objectAtIndex:indexPath.row] descriptionOf];
    
    
    return _foodGroupCell;
    
    
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
    
    [super viewDidLoad];
    [self loadFoodGroups];
    
}

- (void)loadFoodGroups
{
        //--Sample food objects
    Food *_food = [[[Fruit alloc] init] autorelease];
    _food.name = @"Macintosh Apple";
    _food.calories = 12;
    _food.caloriesFromFat = 10;
    _food.carbs = 50;
    _food.protein = 0;
    _food.fat = 12;
    _food.foodGroup = @"Fruit";
    _food.foodType = @"Sweet";
    _food.descriptionOf = @"Best fruits on the planet";
    _food.healthBenefits = @"Promotes healthy teeth";
    _food.healthRisks = @"Seeds can contain trace arsnic particles";
    _food.servingSize = 1;
    _food.measurement = @"apple";
    
    Food *_veg = [[[Vegetable alloc] init] autorelease];
    _veg = [[Food alloc] init];
    _veg.name = @"Carrot";
    _veg.calories = 12;
    _veg.caloriesFromFat = 10;
    _veg.carbs = 50;
    _veg.protein = 0;
    _veg.fat = 12;
    _veg.foodGroup = @"Vegetable";
    _veg.descriptionOf = @"Best vegetables on earth";
    _veg.healthBenefits = @"Promotes healthy eyes";
    _veg.healthRisks = @"Too many can turn you orange";
    _veg.servingSize = 3;
    _veg.measurement = @"carrots";
    
    if (_foodGroups) {
        [_foodGroups release];
    }
    
    
    _foodGroups = [[NSArray alloc] initWithObjects:_food,_veg, nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
