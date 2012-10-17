//
//  AppDelegate.m
//  graph_sv
//
//  Created by Samez on 06.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Model.h"

@implementation AppDelegate
@synthesize text = text_;
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
        
        float height=115.0f;
        float wight=305.0f;
        NSRect r1=CGRectMake(window_.frame.origin.x+450, 350, wight, height);
        NSRect r2=CGRectMake(window_.frame.origin.x+450, 185, wight, height);
        NSRect r3=CGRectMake(window_.frame.origin.x+450, 20, wight, height);
        
        viewA=[[ViewController alloc] initWithFrame:r1];
        viewB=[[ViewController alloc] initWithFrame:r2];
        viewC=[[ViewController alloc] initWithFrame:r3];

    }
    return self;
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    [window_ setFrame:CGRectMake(300, 200, 800, 505) display:YES];
    [window_ setTitle:@"Свертка"];

    [modelA fillByRandom:20];
    [modelB fillByRandom:10];
    
    //[modelA manualFill];
    //[modelB manualFill];
    [modelC setA:[modelA doSv:modelB].A];
    
    [modelA addObserver: self forKeyPath:@"A" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    [modelB addObserver: self forKeyPath:@"A" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    
    [viewA draw:viewA.frame:modelA.A];
    [viewB draw:viewB.frame:modelB.A];
    [viewC draw:viewC.frame:modelC.A];

}

- (void) observeValueForKeyPath: (NSString *) keyPath ofObject: (id) object change: (NSDictionary *) change context: (void *) context{
    
    switch ([object isEqual:modelA]) {
        case YES:
        {
            [viewA draw:viewA.frame:modelA.A];
            [viewC draw:viewC.frame:modelC.A];
        }
            break;
            
        default:
        {
            [viewB draw:viewB.frame:modelB.A];
            [viewC draw:viewC.frame:modelC.A];
        }
            break;
    }
        
}
@end
