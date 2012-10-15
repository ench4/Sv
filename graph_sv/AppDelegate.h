//
//  AppDelegate.h
//  graph_sv
//
//  Created by Samez on 06.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ViewController.h"
#import "Model.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    ViewController *viewA;
    ViewController *viewB;
    ViewController *viewC;
    IBOutlet Model *modelA;
    Model *modelB;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *text;
@property Model *modelA;

@end
