//
//  AppDelegate.h
//  graph_sv
//
//  Created by Samez on 06.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SignalView.h"
#import "MutableSignalView.h"
#import "Model.h"


@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet MutableSignalView *viewA;
    IBOutlet MutableSignalView *viewB;
    IBOutlet SignalView *viewC;
    IBOutlet NSArrayController* controllerA;
    IBOutlet NSArrayController* controllerB;
    IBOutlet NSArrayController* controllerC;
    Model *modelA;
    Model *modelB;
    Model *modelC;
}

@property (assign) IBOutlet NSWindow *window;
@property Model *modelA;

@end
