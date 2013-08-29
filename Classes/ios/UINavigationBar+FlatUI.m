//
//  UINavigationBar+FlatUI.m
//  FlatUI
//
//  Created by Jack Flintermann on 5/3/13.
//  Copyright (c) 2013 Jack Flintermann. All rights reserved.

#import "UINavigationBar+FlatUI.h"
#import "UIImage+FlatUI.h"
#import "UIFont+FlatUI.h"

@implementation UINavigationBar (FlatUI)

- (void) configureFlatNavigationBarWithColor:(UIColor *)color {
    
    [self setBackgroundImage:[UIImage imageWithColor:color cornerRadius:0]
               forBarMetrics:UIBarMetricsDefault & UIBarMetricsLandscapePhone];
    
    NSMutableDictionary *titleTextAttributes = [@{UITextAttributeTextColor:[UIColor whiteColor],
                            UITextAttributeFont:[UIFont flatFontOfSize:22],
                            UITextAttributeTextShadowColor:[UIColor clearColor]
                            } mutableCopy];
    
    
    [self setTitleTextAttributes:titleTextAttributes];
    
    if([self respondsToSelector:@selector(setShadowImage:)])
    {
        [self setShadowImage:[UIImage imageWithColor:[UIColor clearColor] cornerRadius:0]];
    }
}

@end
