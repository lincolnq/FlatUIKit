//
//  UIBarButtonItem+FlatUI.m
//  FlatUI
//
//  Created by Jack Flintermann on 5/8/13.
//  Copyright (c) 2013 Jack Flintermann. All rights reserved.
//

#import "UIBarButtonItem+FlatUI.h"
#import "UIImage+FlatUI.h"
#import "UIFont+FlatUI.h"

@implementation UIBarButtonItem (FlatUI)

- (void) configureFlatButtonWithColor:(UIColor *)color
                     highlightedColor:(UIColor *)highlightedColor
                        disabledColor:(UIColor *)disabledColor
                         cornerRadius:(CGFloat)cornerRadius {
  
  [UIBarButtonItem configureItemOrProxy:self forFlatButtonWithColor:color highlightedColor:highlightedColor disabledColor:disabledColor cornerRadius:cornerRadius];
  
}

+ (void) configureFlatButtonsWithColor:(UIColor *) color
                      highlightedColor:(UIColor *)highlightedColor
                         disabledColor:(UIColor *)disabledColor
                             textColor:(UIColor *)textColor
                          cornerRadius:(CGFloat)cornerRadius {
  
  [self configureFlatButtonsWithColor:color highlightedColor:highlightedColor disabledColor:disabledColor cornerRadius:cornerRadius whenContainedIn:[UINavigationBar class], [UINavigationController class], [UIToolbar class], nil];
  
  [[self appearance] setTitleTextAttributes: @{UITextAttributeTextColor:textColor, UITextAttributeTextShadowColor:[UIColor clearColor], UITextAttributeFont:[UIFont lightFlatFontOfSize:12]} forState:UIControlStateNormal];

}

+ (void) configureFlatButtonsWithColor:(UIColor *) color
                      highlightedColor:(UIColor *)highlightedColor
                         disabledColor:(UIColor *)disabledColor
                          cornerRadius:(CGFloat) cornerRadius
                       whenContainedIn:(Class <UIAppearanceContainer>)containerClass, ... {
  va_list vl;
  va_start(vl, containerClass);
  id appearance = [UIBarButtonItem appearanceWhenContainedIn:containerClass, nil];
  va_end(vl);
  [UIBarButtonItem configureItemOrProxy:appearance forFlatButtonWithColor:color highlightedColor:highlightedColor disabledColor:disabledColor cornerRadius:cornerRadius];
}


- (void) removeTitleShadow {
  NSArray *states = @[@(UIControlStateNormal), @(UIControlStateHighlighted)];
  
  for (NSNumber *state in states) {
    UIControlState controlState = [state unsignedIntegerValue];
    NSMutableDictionary *titleTextAttributes = [[self titleTextAttributesForState:controlState] mutableCopy];
    if (!titleTextAttributes) {
      titleTextAttributes = [NSMutableDictionary dictionary];
    }

    /*** UNEXPECTED ***
     UITextAttributeShadowOffset is deprecated in 5.0 - replaced with NSShadow
     - tried using NSShadow, but the shadow on the title remained
     - shadowOffset <== {0,0}, shadowColor <== nil (shadow not drawn according to docs)
     ******************/
    [titleTextAttributes setValue:[NSValue valueWithUIOffset:UIOffsetZero] forKey:UITextAttributeTextShadowOffset];
    [titleTextAttributes setObject:[UIColor clearColor] forKey:UITextAttributeTextShadowColor];
    [self setTitleTextAttributes:titleTextAttributes forState:controlState];
  }
}



//helper method, basically a wrapper to allow creating a custom UIAppearance method that doesn't conform to the usual naming style
+ (void) configureItemOrProxy:(id)appearance
       forFlatButtonWithColor:(UIColor *)color
             highlightedColor:(UIColor *)highlightedColor
                disabledColor:(UIColor *)disabledColor
                 cornerRadius:(CGFloat) cornerRadius {
  UIImage *backButtonPortraitImage = [UIImage backButtonImageWithColor:color
                                                            barMetrics:UIBarMetricsDefault
                                                          cornerRadius:cornerRadius];
  UIImage *highlightedBackButtonPortraitImage = [UIImage backButtonImageWithColor:highlightedColor
                                                                       barMetrics:UIBarMetricsDefault
                                                                     cornerRadius:cornerRadius];
    UIImage *disabledBackButtonPortraitImage = [UIImage backButtonImageWithColor:disabledColor
                                                                         barMetrics:UIBarMetricsDefault
                                                                       cornerRadius:cornerRadius];

  UIImage *backButtonLandscapeImage = [UIImage backButtonImageWithColor:color
                                                             barMetrics:UIBarMetricsLandscapePhone
                                                           cornerRadius:2];
  UIImage *highlightedBackButtonLandscapeImage = [UIImage backButtonImageWithColor:highlightedColor
                                                                        barMetrics:UIBarMetricsLandscapePhone
                                                                      cornerRadius:2];
    UIImage *disabledBackButtonLandscapeImage = [UIImage backButtonImageWithColor:disabledColor
                                                                          barMetrics:UIBarMetricsLandscapePhone
                                                                        cornerRadius:2];

  
  [appearance setBackButtonBackgroundImage:backButtonPortraitImage
                                  forState:UIControlStateNormal
                                barMetrics:UIBarMetricsDefault];
  [appearance setBackButtonBackgroundImage:backButtonLandscapeImage
                                  forState:UIControlStateNormal
                                barMetrics:UIBarMetricsLandscapePhone];
  [appearance setBackButtonBackgroundImage:highlightedBackButtonPortraitImage
                                  forState:UIControlStateHighlighted
                                barMetrics:UIBarMetricsDefault];
  [appearance setBackButtonBackgroundImage:highlightedBackButtonLandscapeImage
                                  forState:UIControlStateHighlighted
                                barMetrics:UIBarMetricsLandscapePhone];
    [appearance setBackButtonBackgroundImage:disabledBackButtonPortraitImage
                                    forState:UIControlStateDisabled
                                  barMetrics:UIBarMetricsDefault];
    [appearance setBackButtonBackgroundImage:disabledBackButtonLandscapeImage
                                    forState:UIControlStateDisabled
                                  barMetrics:UIBarMetricsLandscapePhone];
  
  [appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(1.0f, 1.0f) forBarMetrics:UIBarMetricsDefault];
  [appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(1.0f, 1.0f) forBarMetrics:UIBarMetricsLandscapePhone];
  
  UIImage *buttonImageNormal       = [UIImage imageWithColor:color cornerRadius:cornerRadius];
  UIImage *buttonImageHightlighted = [UIImage imageWithColor:highlightedColor cornerRadius:cornerRadius];
    UIImage *buttonImageDisabled = [UIImage imageWithColor:disabledColor cornerRadius:cornerRadius];

  [appearance setBackgroundImage:buttonImageNormal forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
  [appearance setBackgroundImage:buttonImageHightlighted forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [appearance setBackgroundImage:buttonImageDisabled forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];

    
}

@end
