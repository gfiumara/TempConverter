//
//  ViewController.m
//  TempConverter
//
//  Created by Greg Fiumara on 1/4/15.
//  Copyright (c) 2015 Greg Fiumara. All rights reserved.
//

#import "TemperatureConversions.h"

#import "ViewController.h"

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
	[self.fahrenheitTextField becomeFirstResponder];
	[super viewWillAppear:animated];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	/* Perform the replacement */
	NSString *temperatureString = [textField.text stringByReplacingCharactersInRange:range withString:string];
	if ([string isEqualToString:@"."]) {
		temperatureString = [temperatureString stringByReplacingOccurrencesOfString:@"." withString:@""];
		temperatureString = [NSString stringWithFormat:@"%@.", temperatureString];
	}
	if ([temperatureString isEqualToString:@""])
		temperatureString = @"0";
	double temperatureValue = temperatureString.doubleValue;

	NSNumberFormatter *temperatureFormatter = [NSNumberFormatter new];
	temperatureFormatter.numberStyle = NSNumberFormatterDecimalStyle;
	temperatureFormatter.maximumFractionDigits = 2;

	if (textField == self.kelvinTextField) {
		self.fahrenheitTextField.text = [temperatureFormatter stringFromNumber:@([TemperatureConversions convertToFahrenheitWithKelvin:temperatureValue])];
		self.celciusTextField.text = [temperatureFormatter stringFromNumber:@([TemperatureConversions convertToCelciusWithKelvin:temperatureValue])];
//		self.fahrenheitTextField.text = [@([TemperatureConversions convertToFahrenheitWithKelvin:temperatureValue]) stringValue];
//		self.celciusTextField.text = [@([TemperatureConversions convertToCelciusWithKelvin:temperatureValue]) stringValue];
	} else if (textField == self.celciusTextField) {
		self.fahrenheitTextField.text = [temperatureFormatter stringFromNumber:@([TemperatureConversions convertToFahrenheitWithCelcius:temperatureValue])];
		self.kelvinTextField.text = [temperatureFormatter stringFromNumber:@([TemperatureConversions convertToKelvinWithCelcius:temperatureValue])];
//		self.fahrenheitTextField.text = [@([TemperatureConversions convertToFahrenheitWithCelcius:temperatureValue]) stringValue];
//		self.kelvinTextField.text = [@([TemperatureConversions convertToKelvinWithCelcius:temperatureValue]) stringValue];
	} else if (textField == self.fahrenheitTextField) {
		self.celciusTextField.text = [temperatureFormatter stringFromNumber:@([TemperatureConversions convertToCelciusWithFarenheit:temperatureValue])];
		self.kelvinTextField.text = [temperatureFormatter stringFromNumber:@([TemperatureConversions convertToKelvinWithFahrenheit:temperatureValue])];
//		self.celciusTextField.text = [@([TemperatureConversions convertToCelciusWithFarenheit:temperatureValue]) stringValue];
//		self.kelvinTextField.text = [@([TemperatureConversions convertToKelvinWithFahrenheit:temperatureValue]) stringValue];
	}


	if (([temperatureString characterAtIndex:0] == '0') && (temperatureString.length > 1))
		temperatureString = [temperatureString substringFromIndex:1];
	textField.text = temperatureString;

	[self updateTemperatureImage];
	[self updateSignChangedButtonCaptions];
	
	return (NO);
}

- (void)updateTemperatureImage
{
	[UIView transitionWithView:self.imageView
			  duration:0.3
			   options:UIViewAnimationOptionTransitionCrossDissolve
			animations:^() {
				if ([self.celciusTextField.text integerValue] > 32)
					self.imageView.image = [UIImage imageNamed:@"sun"];
				else if ([self.celciusTextField.text integerValue] < 0)
					self.imageView.image = [UIImage imageNamed:@"igloo"];
				else
					self.imageView.image = nil;
			}
			completion:NULL];
}

- (IBAction)signChangeButtonPressed:(UIButton *)button
{
	BOOL makeNegative = [button.titleLabel.text isEqualToString:@"-"];
	if (button == self.fahrenheitSignChangeButton) {
		if (makeNegative)
			[self textField:self.fahrenheitTextField shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@"-"];
		else
			[self textField:self.fahrenheitTextField shouldChangeCharactersInRange:NSMakeRange(0, 1) replacementString:@""];
	} else if (button == self.celciusSignChangeButton) {
		if (makeNegative)
			[self textField:self.celciusTextField shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@"-"];
		else
			[self textField:self.celciusTextField shouldChangeCharactersInRange:NSMakeRange(0, 1) replacementString:@""];
	} else if (button == self.kelvinSignChangeButton) {
		if (makeNegative)
			[self textField:self.kelvinTextField shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@"-"];
		else
			[self textField:self.kelvinTextField shouldChangeCharactersInRange:NSMakeRange(0, 1) replacementString:@""];
	}

	[self updateSignChangedButtonCaptions];
}

- (void)updateSignChangedButtonCaptions
{
	if ((self.fahrenheitTextField.text.length > 1) && ([self.fahrenheitTextField.text characterAtIndex:0] == '-'))
		[self.fahrenheitSignChangeButton setTitle:@"+" forState:UIControlStateNormal];
	else {
		if ([self.fahrenheitTextField.text isEqualToString:@"0"])
			[self.fahrenheitSignChangeButton setTitle:@"" forState:UIControlStateNormal];
		else
			[self.fahrenheitSignChangeButton setTitle:@"-" forState:UIControlStateNormal];
	}

	if ((self.celciusTextField.text.length > 1) && ([self.celciusTextField.text characterAtIndex:0] == '-'))
		[self.celciusSignChangeButton setTitle:@"+" forState:UIControlStateNormal];
	else {
		if ([self.celciusTextField.text isEqualToString:@"0"])
			[self.celciusSignChangeButton setTitle:@"" forState:UIControlStateNormal];
		else
			[self.celciusSignChangeButton setTitle:@"-" forState:UIControlStateNormal];
	}
	if ((self.kelvinTextField.text.length > 1) && ([self.kelvinTextField.text characterAtIndex:0] == '-'))
		[self.kelvinSignChangeButton setTitle:@"+" forState:UIControlStateNormal];
	else {
		if ([self.kelvinTextField.text isEqualToString:@"0"])
			[self.kelvinSignChangeButton setTitle:@"" forState:UIControlStateNormal];
		else
			[self.kelvinSignChangeButton setTitle:@"-" forState:UIControlStateNormal];
	}
}

@end
