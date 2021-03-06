//
//  UIColor+FlatUI.h
//  FlatUI
//
//  Created by Jack Flintermann on 5/3/13.
//  Copyright (c) 2013 Jack Flintermann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FlatUI)

+ (UIColor *) colorFromHexCode:(NSString *)hexString;

+ (UIColor*) whiteShadowColor;
+ (UIColor*) blackShadowColor;
+ (UIColor*) gray20;
+ (UIColor*) gray40;
+ (UIColor*) gray60;
+ (UIColor*) gray70;
+ (UIColor*) gray80;
+ (UIColor*) gray90;
+ (UIColor*) gray95;
+ (UIColor *) neonRed;
+ (UIColor *) neonBlue;
+ (UIColor *) neonGreen;
+ (UIColor *) turquoiseColor;
+ (UIColor *) greenSeaColor;
+ (UIColor *) emerlandColor;
+ (UIColor *) nephritisColor;
+ (UIColor *) belizeHoleColor;
+ (UIColor *) navColor;
+ (UIColor *) coloradoRiverColor;
+ (UIColor *) darkColoradoRiverColor;
+ (UIColor *) amethystColor;
+ (UIColor *) wisteriaColor;
+ (UIColor *) wetAsphaltColor;
+ (UIColor *) midnightBlueColor;
+ (UIColor *) sunflowerColor;
+ (UIColor *) tangerineColor;
+ (UIColor *) carrotColor;
+ (UIColor *) pumpkinColor;
+ (UIColor *) billColor;
+ (UIColor *) brightRedColor;
+ (UIColor *) cloudsColor;
+ (UIColor *) silverColor;
+ (UIColor *) concreteColor;
+ (UIColor *) asbestosColor;

+ (UIColor *) blendedColorWithForegroundColor:(UIColor *)foregroundColor
                              backgroundColor:(UIColor *)backgroundColor
                                 percentBlend:(CGFloat) percentBlend;

@end
