//
//  TemperatureConversions.h
//  TempConverter
//
//  Created by Greg Fiumara on 1/4/15.
//  Copyright (c) 2015 Greg Fiumara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TemperatureConversions : NSObject

#pragma mark - Celcius to Other

+ (double)convertToKelvinWithCelcius:(double)celcius;
+ (double)convertToFahrenheitWithCelcius:(double)celcius;

#pragma mark - Fahrenheit to Other

+ (double)convertToKelvinWithFahrenheit:(double)fahrenheit;
+ (double)convertToCelciusWithFarenheit:(double)fahrenheit;

#pragma mark - Kelvin to Other

+ (double)convertToFahrenheitWithKelvin:(double)kelvin;
+ (double)convertToCelciusWithKelvin:(double)kelvin;

@end
