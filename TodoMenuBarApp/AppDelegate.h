//
//  AppDelegate.h
//  TodoMenuBarApp
//
//  Created by Glenn Willen on 9/13/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum {
    GEM_COLOR_RED,
    GEM_COLOR_YELLOW,
    GEM_COLOR_GREEN,
    GEM_COLOR_BLUE,
    GEM_COLOR_OVERFLOW
} gem_color_t;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSMenu *statusMenu;
    NSStatusItem *statusItem;
    gem_color_t gem_color;
}

@property (assign) IBOutlet NSWindow *window;

@end
