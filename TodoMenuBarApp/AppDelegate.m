//
//  AppDelegate.m
//  TodoMenuBarApp
//
//  Created by Glenn Willen on 9/13/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

static NSArray *todoItems;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

-(void)awakeFromNib {
    statusMenu = [[NSMenu alloc] init];
    todoItems = @[
                  @"one",
                  @"two"
                  ];
    
    for (NSString *item in todoItems) {
        NSMenuItem* newItem = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:item action:@selector(cycleGemColor) keyEquivalent:@""];
        //[newItem setEnabled:YES];
        [statusMenu insertItem:newItem atIndex: [[statusMenu itemArray] count]];
    }
    
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    [statusItem setMenu:statusMenu];
    //[statusItem setTitle:@"Status"];
    [statusItem setHighlightMode:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(cycleGemColor)
                                   userInfo:nil
                                    repeats:YES];
    
    [self cycleGemColor];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *todofile = [fm attributesOfItemAtPath:@"/Users/gwillen/todogem" error:nil];
    NSDate *todofile_mod = [todofile fileModificationDate];
}

-(void)cycleGemColor {
    gem_color++;
    if (gem_color == GEM_COLOR_OVERFLOW) {
        gem_color = 0;
    }
    
    NSString *color_file = @"";
    switch (gem_color) {
        case GEM_COLOR_RED:
            color_file = @"red_gem.png";
            break;
        case GEM_COLOR_YELLOW:
            color_file = @"yellow_gem.png";
            break;
        case GEM_COLOR_GREEN:
            color_file = @"green_gem.png";
            break;
        case GEM_COLOR_BLUE:
            color_file = @"blue_gem.png";
            break;
        default:
            break;
    }
    
    NSLog(@"about to cycle color to %@", color_file);
    [statusItem setImage:[NSImage imageNamed:color_file]];
    NSLog(@"did cycle color to %@", color_file);
}

@end
