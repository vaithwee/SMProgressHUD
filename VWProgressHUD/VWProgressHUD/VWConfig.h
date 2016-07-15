//
// Created by Vaith on 16/7/15.
// Copyright (c) 2016 Vaith. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

extern NSInteger const BACKGROUNDCOLOR;


@interface VWConfig : NSObject
@end