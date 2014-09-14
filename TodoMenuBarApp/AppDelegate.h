//
//  AppDelegate.h
//  TodoMenuBarApp
//
//  Created by Glenn Willen on 9/13/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "TodoItem.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSMenu *statusMenu;
    NSStatusItem *statusItem;
    gem_color_t gemColor;
}

@property (assign) IBOutlet NSWindow *window;

@end
