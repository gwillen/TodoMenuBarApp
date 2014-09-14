//
//  TodoItem.m
//  TodoMenuBarApp
//
//  Created by Glenn Willen on 9/14/14.
//  Copyright (c) 2014 Glenn Willen. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

@synthesize color = _color;

-(void)setColor:(gem_color_t)color {
    _color = color;
    if ([self menuItem]) {
        [[self menuItem] setImage:[TodoItem imageForColor:_color]];
    }
}

-(gem_color_t)color {
    return _color;
}

+(gem_color_t)nextColorAfter:(gem_color_t)color {
    color++;
    // RYG, Skip blue
    if (color == GEM_COLOR_BLUE) {
        color = GEM_COLOR_RED;
    }
    return color;
}

+(NSString *)nameForColor:(gem_color_t)color {
    switch (color) {
        case GEM_COLOR_RED:
            return @"red";
        case GEM_COLOR_YELLOW:
            return @"yellow";
        case GEM_COLOR_GREEN:
            return @"green";
        case GEM_COLOR_BLUE:
            return @"blue";
        default:
            return @"";
    }
}

+(NSImage *)imageForColor:(gem_color_t)color {
    return [NSImage imageNamed:[NSString stringWithFormat:@"%@_gem.png", [self nameForColor:color]]];
}

@end
