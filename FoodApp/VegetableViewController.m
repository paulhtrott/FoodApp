//
//  VegetableViewController.m
//  FoodApp
//
//  Created by Paul Trott on 7/5/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import "VegetableViewController.h"
#import "Fruit.h"
#import "Vegetable.h"

@interface VegetableViewController ()

@property (nonatomic, strong) NSArray *foodGroups;

@end

@implementation VegetableViewController


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
        self.title = NSLocalizedString(@"Vegetables", "Vegetables");
    }
    return self;
}

#pragma mark - Table View Setup
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Vegetables Array Count: %d", [_foodGroups count]);
    return [_foodGroups count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *_foodGroupCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!_foodGroupCell) {
        _foodGroupCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil] autorelease];
        _foodGroupCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    _foodGroupCell.textLabel.text = [[_foodGroups objectAtIndex:indexPath.row] name];
    
    NSMutableString *detailedText = [[[NSMutableString alloc] init] autorelease];
    
    if ([[[_foodGroups objectAtIndex:indexPath.row] foodType] isEqual:@"No Type"]) {
        [detailedText appendString:@"Serving Size "];
    } else {
        [detailedText appendString:[[_foodGroups objectAtIndex:indexPath.row] foodType]];
        [detailedText appendString:@" - Serving Size: "];
    }
    
    [detailedText appendString:[NSString stringWithFormat:@"%.2f", [[_foodGroups objectAtIndex:indexPath.row] servingSize]]];
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
    
    Food *_orange = [[[Fruit alloc] init] autorelease];
    _orange.name = @"Florida Orange";
    _orange.calories = 95;
    _orange.caloriesFromFat = 12;
    _orange.carbs = 55;
    _orange.protein = 12.1;
    _orange.fat = 3.4;
    _orange.foodGroup = @"Fruit";
    _orange.foodType = @"Acidic";
    _orange.descriptionOf = @"Juicy and sweet and renowned for its concentration of vitamin C, oranges make the perfect snack and add a special tang to many recipes; it is no wonder that they are one of the most popular fruits in the world. Oranges are generally available from winter through summer with seasonal variations depending on the variety. \nOranges are round citrus fruits with finely-textured skins that are, of course, orange in color just like their pulpy flesh; the skin can vary in thickness from very thin to very thick. Oranges usually range from approximately two to three inches in diameter. ";
    _orange.healthBenefits = @"In recent research studies, the healing properties of oranges have been associated with a wide variety of phytonutrient compounds. These phytonutrients include citrus flavanones (types of flavonoids that include the molecules hesperetin and naringenin), anthocyanins, hydroxycinnamic acids, and a variety of polyphenols. When these phytonutrients are studied in combination with oranges—vitamin C, the significant antioxidant properties of this fruit are understandable. \nBut it is yet another flavanone in oranges, the herperidin molecule, which has been singled out in phytonutrient research on oranges. Arguably, the most important flavanone in oranges, herperidin has been shown to lower high blood pressure as well as cholesterol in animal studies, and to have strong anti-inflammatory properties. Importantly, most of this phytonutrient is found in the peel and inner white pulp of the orange, rather than in its liquid orange center, so this beneficial compound is too often removed by the processing of oranges into juice. ";
    _orange.healthRisks = @"One of the most plentiful sugars in fruit juice \"fructose\" is often touted as a healthier alternative to another form of sugar found in food known as sucrose. Part of this \"healthy\" reputation is based on the fact that fructose is the predominant sugar found in fruit. Another factor said to be in fructose’s favour is that it does not cause blood sugar levels to rise in the way sucrose does. However, the reality is there is plenty of evidence suggests that fructose is every bit as damaging to the body as sucrose.";
    _orange.servingSize = 1;
    _orange.measurement = @"orange";
    
    return _orange;
}

- (Food *)getVeggie
{
    Food *_stringBean = [[[Vegetable alloc] init] autorelease];
    _stringBean.name = @"Blue Lake Green Beans";
    _stringBean.calories = 12;
    _stringBean.caloriesFromFat = 2;
    _stringBean.carbs = 1.34;
    _stringBean.protein = .25;
    _stringBean.fat = 0;
    _stringBean.foodGroup = @"Vegetable";
    _stringBean.foodType = @"Green Bean";
    _stringBean.descriptionOf = @"Commonly referred to as string beans, the string that once was their trademark (running lengthwise down the seam of the pod) can seldom be found in modern varieties. It's for this reason (the breeding out of the \"string\") that string beans are often referred to as \"snap beans.\" Because they are picked at a younger, immature stage, \"snap beans\" can literally be snapped in half with a simple twist of the fingers. Although these bright green and crunchy beans are available at your local market throughout the year, they are in season from summer through early fall when they are at their best and the least expensive. You may also see them referred to as \"haricot vert\"—this term simply means \"green bean\" in French and is the common French term for this vegetable. This term can also refer to specific varieties of green beans that are popular in French cuisine because of their very thin shape and very tender texture";
    _stringBean.healthBenefits = @"Best studied from a research standpoint is the antioxidant content of green beans. In addition to conventional antioxidant nutrients like vitamin C and beta-carotene, green beans contain important amounts of the antioxidant mineral manganese. But the area of phytonutrients is where green beans really shine through in their antioxidant value. Green beans contain a wide variety of carotenoids (including lutein, beta-carotene, violaxanthin, and neoxanthin) and flavonoids (including quercetin, kaemferol, catechins, epicatechins, and procyanidins) that have all been shown to have health-supportive antioxidant properties. In addition, the overall antioxidant capacity of green beans has been measured in several research studies, and in one study, green beans have been shown to have greater overall antioxidant capacity than similar foods in the pea and bean families, for example, snow peas or winged beans. ";
    _stringBean.healthRisks = @"Green beans are among a small number of foods that contain measurable amounts of oxalates, naturally-occurring substances found in plants, animals, and human beings. When oxalates become too concentrated in body fluids, they can crystallize and cause health problems. For this reason, individuals with already existing and untreated kidney or gallbladder problems may want to avoid eating green beans. Laboratory studies have shown that oxalates may also interfere with absorption of calcium from the body. Yet, in every peer-reviewed research study we've seen, the ability of oxalates to lower calcium absorption is relatively small and definitely does not outweigh the ability of oxalate-containing foods to contribute calcium to the meal plan. If your digestive tract is healthy, and you do a good job of chewing and relaxing while you enjoy your meals, you will get significant benefits—including absorption of calcium—from calcium-rich foods plant foods that also contain oxalic acid. Ordinarily, a healthcare practitioner would not discourage a person focused on ensuring that they are meeting their calcium requirements from eating these nutrient-rich foods because of their oxalate content.";
    _stringBean.servingSize = 122.00;
    _stringBean.measurement = @"grams";
    
    return _stringBean;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
