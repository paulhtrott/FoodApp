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

@property(nonatomic, strong) NSArray *foodGroups;

@end

@implementation FoodViewController

- (void)dealloc
{
    [_foodGroupTable release]; _foodGroupTable = nil;
    
    [super dealloc];
}

- (IBAction)backButton:(id)sender
{
    [self.view removeFromSuperview];
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
    Food *fruit = self.getFruit;
    Food *veg = self.getVeggie;
    
    if (_foodGroups) {
        [_foodGroups release];
    }
    
    NSLog(@"New Count: %d", [_foodGroups count]);
    
    _foodGroups = [[NSArray alloc] initWithObjects:fruit, veg, nil];
    
}

- (Food *)getFruit
{
    Food *_fruit = [[[Fruit alloc] init] autorelease];
    _fruit.name = @"Macintosh Apple";
    _fruit.calories = 12;
    _fruit.caloriesFromFat = 10;
    _fruit.carbs = 50;
    _fruit.protein = 0;
    _fruit.fat = 12;
    _fruit.foodGroup = @"Fruit";
    _fruit.foodType = @"Sweet";
    _fruit.descriptionOf = @"Best fruits on the planet";
    _fruit.healthBenefits = @"Promotes healthy teeth";
    _fruit.healthRisks = @"Seeds can contain trace arsnic particles";
    _fruit.servingSize = 1;
    _fruit.measurement = @"apple";
    
    return _fruit;
}

- (Food *)getVeggie
{
    Food *_veg = [[[Vegetable alloc] init] autorelease];
    _veg.name = @"Carrot";
    _veg.calories = 100;
    _veg.caloriesFromFat = 13;
    _veg.carbs = 23.3;
    _veg.protein = 1.3;
    _veg.fat = 0;
    _veg.foodGroup = @"Vegetable";
    _veg.descriptionOf = @"Best vegetables on earth";
    _veg.healthBenefits = @"Promotes healthy eyes";
    _veg.healthRisks = @"Too many can turn you orange";
    _veg.servingSize = 3;
    _veg.measurement = @"cups";
    
    return _veg;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
