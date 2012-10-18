//
//  AppDelegate.h
//  graph_sv
//
//  Created by Samez on 06.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SignalView.h"
#import "Model.h"


@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet SignalView *viewA;
    IBOutlet SignalView *viewB;
    IBOutlet SignalView *viewC;
    IBOutlet NSArrayController* controllerA;
    IBOutlet NSArrayController* controllerB;
    IBOutlet NSArrayController* controllerC;
    Model *modelA;
    Model *modelB;
    Model *modelC;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *text;
@property Model *modelA;

@end
