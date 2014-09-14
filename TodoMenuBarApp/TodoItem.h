//
//  TodoItem.h
//  TodoMenuBarApp
//
//  Created by Glenn Willen on 9/14/14.
//  Copyright (c) 2014 Glenn Willen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GEM_COLOR_RED,
    GEM_COLOR_YELLOW,
    GEM_COLOR_GREEN,
    GEM_COLOR_BLUE,
    GEM_COLOR_OVERFLOW
} gem_color_t;

@interface TodoItem : NSObject

@property NSMenuItem *menuItem;
@property NSString *title;
@property gem_color_t color;


+(gem_color_t)nextColorAfter:(gem_color_t)color;
+(NSString *)nameForColor:(gem_color_t)color;
+(NSImage *)imageForColor:(gem_color_t)color;

@end
