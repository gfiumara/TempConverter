#import "TemperatureConversions.h"

@implementation TemperatureConversions

const double ABSOLUTE_ZERO = -273.15;

#pragma mark - Celcius to Other

+ (double)convertToKelvinWithCelcius:(double)celcius
{
	return (celcius - ABSOLUTE_ZERO);
}

+ (double)convertToFahrenheitWithCelcius:(double)celcius
{
	return ((celcius * (9.0 / 5.0)) + 32.0);
}

#pragma mark - Fahrenheit to Other

+ (double)convertToKelvinWithFahrenheit:(double)fahrenheit
{
	return ([TemperatureConversions convertToCelciusWithFarenheit:fahrenheit] - ABSOLUTE_ZERO);
}

+ (double)convertToCelciusWithFarenheit:(double)fahrenheit
{
	return ((fahrenheit - 32.0) * (5.0 / 9.0));
}

#pragma mark - Kelvin to Other

+ (double)convertToFahrenheitWithKelvin:(double)kelvin
{
	return (((kelvin + ABSOLUTE_ZERO) * (9.0 / 5.0)) + 32.0);
}

+ (double)convertToCelciusWithKelvin:(double)kelvin
{
	return (kelvin + ABSOLUTE_ZERO);
}

@end
