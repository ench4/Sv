//
//  AppDelegate.m
//  graph_sv
//
//  Created by Samez on 06.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import "AppDelegate.h"
#import "SignalView.h"
#import "Model.h"

@implementation AppDelegate
@synthesize window = window_;
@synthesize modelA;
- (id) init
{
    self=[super init];
    if (self)
    {
        modelA=[[Model alloc] init];
        modelB=[[Model alloc] init];
        modelC=[[Model alloc] init];
        
    }
    return self;
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [window_ setTitle:@"Свертка"];

    [modelA fillByRandom:10];
    [modelB fillByRandom:10];

    [modelC setVector:[modelA doSv:modelB].vector];
    
    [controllerA addObserver:self forKeyPath:@"arrangedObjects.value" options:0 context:nil];
    [controllerB addObserver:self forKeyPath:@"arrangedObjects.value" options:0 context:nil];
    
    [viewA bind:@"vector" toObject:controllerA withKeyPath:@"arrangedObjects.value" options:nil];
    [viewB bind:@"vector" toObject:controllerB withKeyPath:@"arrangedObjects.value" options:nil];
    [viewC bind:@"vector" toObject:controllerC withKeyPath:@"arrangedObjects.value" options:nil];
    
    [controllerA addObserver:viewA forKeyPath:@"arrangedObjects.value" options:0 context:nil];
    [controllerB addObserver:viewB forKeyPath:@"arrangedObjects.value" options:0 context:nil];
    [controllerC addObserver:viewC forKeyPath:@"arrangedObjects.value" options:0 context:nil];
}

- (void) observeValueForKeyPath: (NSString *) keyPath ofObject: (id) object change: (NSDictionary *) change context: (void *) contex
{
    [modelC setVector:[modelA doSv:modelB].vector];
}
@end
