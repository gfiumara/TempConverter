//
//  ViewController.h
//  TempConverter
//
//  Created by Greg Fiumara on 1/4/15.
//  Copyright (c) 2015 Greg Fiumara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celciusTextField;
@property (weak, nonatomic) IBOutlet UITextField *kelvinTextField;
@property (weak, nonatomic) IBOutlet UIButton *fahrenheitSignChangeButton;
@property (weak, nonatomic) IBOutlet UIButton *celciusSignChangeButton;
@property (weak, nonatomic) IBOutlet UIButton *kelvinSignChangeButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

