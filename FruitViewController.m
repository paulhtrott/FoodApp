//
//  FruitViewController
//  FoodApp
//
//  Created by Paul Trott on 6/17/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "FruitViewController.h"
#import "Fruit.h"
#import "Vegetable.h"

@interface FruitViewController ()

@property(nonatomic, strong) NSArray *foodGroups;

@end

@implementation FruitViewController

- (void)dealloc
{
    [_foodGroupTable release]; _foodGroupTable = nil;
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Fruits", @"Fruits");
    }
    return self;
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
    
    _foodGroupCell.textLabel.text = [[_foodGroups objectAtIndex:indexPath.row] name];
    
    NSMutableString *detailedText = [[[NSMutableString alloc] init] autorelease];
    
    if ([[[_foodGroups objectAtIndex:indexPath.row] foodType] isEqual: @"No Type"]) {
        [detailedText appendString:@"Serving Size: "];
        
    } else {
        [detailedText appendString:[[_foodGroups objectAtIndex:indexPath.row] foodType]];
        [detailedText appendString:@" - Serving Size: "];
    }
    
    [detailedText appendString:[NSString stringWithFormat:@"%.2f",[[_foodGroups objectAtIndex:indexPath.row] servingSize]]];
    [detailedText appendString:@" "];
    [detailedText appendString:[[_foodGroups objectAtIndex:indexPath.row] measurement]];
    
    _foodGroupCell.detailTextLabel.text = detailedText;
    
    
    
    return _foodGroupCell;
    
    
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
    
    Food *_banana = [[[Fruit alloc] init] autorelease];
    _banana.name = @"Chaquita Banana";
    _banana.calories = 100;
    _banana.caloriesFromFat = 45;
    _banana.carbs = 35;
    _banana.protein = 0;
    _banana.fat = 2;
    _banana.foodGroup = @"Fruit";
    _banana.foodType = @"Sweet";
    _banana.descriptionOf = @"Best Bananas on around";
    _banana.healthBenefits = @"Super Yellow";
    _banana.healthRisks = @"Diarrhea";
    _banana.servingSize = 1;
    _banana.measurement = @"large banana";
    
    return _banana;
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
    _veg.servingSize = 3.256;
    _veg.measurement = @"cups";
    
    return _veg;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
