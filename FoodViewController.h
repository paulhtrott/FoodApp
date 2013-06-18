//
//  FoodViewController.h
//  FoodApp
//
//  Created by Paul Trott on 6/17/13.
//  Copyright (c) 2013 Paul Trott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>
{
    IBOutlet UITextField *_txtFoodName;
    IBOutlet UILabel *_txtFoodTitle;
}

@property(nonatomic, strong) UITextField *txtFoodName;
@property(nonatomic, strong) UILabel *txtFoodTitle;

- (IBAction)btnClicked:(id)sender;

@end
