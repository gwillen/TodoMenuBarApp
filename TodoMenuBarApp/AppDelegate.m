//
//  AppDelegate.m
//  TodoMenuBarApp
//
//  Created by Glenn Willen on 9/13/14.
//  Copyright (c) 2014 Glenn Willen. All rights reserved.
//

#import "AppDelegate.h"
#import "TodoItem.h"

@implementation AppDelegate

static NSArray *todoTitles;
static NSMutableArray *todoItems;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

-(void)awakeFromNib {
    statusMenu = [[NSMenu alloc] init];
    todoTitles = @[
                   @"GCal (no remaining events)",
                   @"Beeminder (no red goals)",
                   @"HabitRPG (complete all dailies)",
                   @"Notebook (cycle through all pages)"
                   ];
    
    todoItems = [[NSMutableArray alloc] init];
    
    for (NSString *item in todoTitles) {
        TodoItem *newItem = [[TodoItem alloc] init];
        [todoItems addObject:newItem];
        newItem.menuItem = [[NSMenuItem alloc] initWithTitle:item action:@selector(menuItemClick:) keyEquivalent:@""];
        newItem.title = item;
        newItem.color = GEM_COLOR_RED;
        [newItem.menuItem setRepresentedObject:newItem];
        [statusMenu insertItem:newItem.menuItem atIndex: [[statusMenu itemArray] count]];
    }
    
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    [statusItem setMenu:statusMenu];
    [statusItem setHighlightMode:YES];
    [statusItem setImage:[TodoItem imageForColor:GEM_COLOR_RED]];
}

-(void)menuItemClick:(NSMenuItem *)sender {
    TodoItem *t = [sender representedObject];
    NSLog(@"CLICK SENDER IS %@ (%@)", t, sender);
    t.color = [TodoItem nextColorAfter:t.color];
    
    gem_color_t leastColor = GEM_COLOR_BLUE;
    for (TodoItem *item in todoItems) {
        if (item.color < leastColor) {
            leastColor = item.color;
        }
    }
    
    [statusItem setImage:[TodoItem imageForColor:leastColor]];
}

-(void)cycleGemColor {
    gemColor = [TodoItem nextColorAfter:gemColor];
    [statusItem setImage:[TodoItem imageForColor:gemColor]];
}

@end
