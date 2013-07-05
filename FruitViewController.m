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
    [_detailViewController release]; _detailViewController = nil;
    
    [super dealloc];
}

#pragma mark - Nib File Setup

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Fruits", @"Fruits");
    }
    return self;
}


#pragma mark - Table View Setup

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Fruit Array Count: %d", [_foodGroups count]);
    
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

#pragma mark - Cell In Table Clicked
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Food *clickedFood;
    
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
    }
    
    clickedFood = [_foodGroups objectAtIndex:[indexPath row]];
    
    self.detailViewController.detailFood = clickedFood;
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

#pragma mark - View Loading

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
    _banana.descriptionOf = @"Wonderfully sweet with firm and creamy flesh, bananas come prepackaged in their own yellow jackets and are available for harvest throughout the year. The banana plant grows 10 to 26 feet and belongs to the same family as the lily and the orchid. The cluster of fruits contain anywhere from 50 to 150 bananas with individual fruits grouped in bunches, known as \"hands,\" containing 10 to 25 bananas.";
    _banana.healthBenefits = @"Bananas are one of our best sources of potassium, an essential mineral for maintaining normal blood pressure and heart function. Since the average banana contains a whopping 467 mg of potassium and only 1 mg of sodium, a banana a day may help to prevent high blood pressure and protect against atherosclerosis. The effectiveness of potassium-rich foods such as bananas in lowering blood pressure has been demonstrated by a number of studies. For example, researchers tracked over 40,000 American male health professionals over four years to determine the effects of diet on blood pressure. Men who ate diets higher in potassium-rich foods, as well as foods high in magnesium and cereal fiber, had a substantially reduced risk of stroke. ";
    _banana.healthRisks = @"Like avocados and chestnuts, bananas and plantain contain substances called chitinases that are associated with the latex-fruit allergy syndrome. There is strong evidence of the cross-reaction between latex and these foods. If you have a latex allergy, you may very likely be allergic to these foods as well. Processing the fruit with ethylene gas increases these enzymes; organic produce not treated with gas will have fewer allergy-causing compounds. In addition, cooking the food may deactivate the enzymes.";
    _banana.servingSize = 1;
    _banana.measurement = @"banana";
    
    return _banana;
}

- (Food *)getVeggie
{
    Food *_veg = [[[Vegetable alloc] init] autorelease];
    _veg.name = @"Carrot";
    _veg.calories = 50;
    _veg.caloriesFromFat = 13;
    _veg.carbs = 23.3;
    _veg.protein = 1.3;
    _veg.fat = 0;
    _veg.foodGroup = @"Vegetable";
    _veg.descriptionOf = @"Although carrots are available throughout the year, locally grown carrots are in season in the summer and fall when they are the freshest and most flavorful. Carrots belong to the Umbelliferae family, named after the umbrella-like flower clusters that plants in this family produce. As such, carrots are related to parsnips, fennel, parsley, anise, caraway, cumin and dill. Carrots can be as small as two inches or as long as three feet, ranging in diameter from one-half of an inch to over two inches. Carrot roots have a crunchy texture and a sweet and minty aromatic taste, while the greens are fresh tasting and slightly bitter. While we usually associate carrots with the color orange, carrots can actually be found in a host of other colors including white, yellow, red, or purple. In fact, purple, yellow and red carrots were the only color varieties of carrots to be cultivated before the 15th or 16th century. ";
    _veg.healthBenefits = @"Carrots are perhaps best known for their rich supply of the antioxidant nutrient that was actually named for them: beta-carotene. However, these delicious root vegetables are the source not only of beta-carotene, but also of a wide variety of antioxidants and other health-supporting nutrients. The areas of antioxidant benefits, cardiovascular benefits, and anti-cancer benefits are the best-researched areas of health research with respect to dietary intake of carrots.";
    _veg.healthRisks = @"Excessive consumption of carotene-rich foods may lead to a condition called carotoderma in which the palms or other skin develops a yellow or orange cast. This yellowing of the skin is presumably related to carotenemia, excessive levels of carotene in the blood. The health impact of carotenemia is not well researched. Eating or juicing high amounts of foods rich in carotene, like carrots, may over tax the body's ability to convert these foods to vitamin A. The body slowly converts carotene to vitamin A, and extra carotene is stored, usually in the palms, soles or behind the ears. If the cause of the carotenemia is eating excessively high amounts of foods like carrots, the condition will usually disappear after reducing consumption. ";
    _veg.servingSize = 122.00;
    _veg.measurement = @"grams";
    
    return _veg;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
