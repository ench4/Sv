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
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [window_ setFrame:CGRectMake(300, 200, 800, 500) display:YES];
    [window_ setTitle:@"Свертка"];
    
    float height=115.0f;
    float wight=305.0f;
    NSRect r1=CGRectMake(450, 350, wight, height);
    NSRect r2=CGRectMake(450, 175, wight, height);
    NSRect r3=CGRectMake(450, 0, wight, height);
    
    viewA=[[ViewController alloc] initWithFrame:r1];
    viewB=[[ViewController alloc] initWithFrame:r2];
    viewC=[[ViewController alloc] initWithFrame:r3];
    
    modelA=[[Model alloc] init];
    modelB=[[Model alloc] init];
    //[a fillByRandom:50];
    //b fillByRandom:20];
    [modelA manualFill];	
    [modelB manualFill];
    [modelA addObserver: self forKeyPath:@"A" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
   // [modelB addObserver: self forKeyPath:@"A" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    
    [viewA draw:r1:modelA.A];
    [viewB draw:r2:modelB.A];
    [viewC draw:r3:[modelA doSv:modelB].A];
    
    int lol;
    scanf("%i",&lol);
    [modelA fillByRandom:lol];


}
- (void) observeValueForKeyPath: (NSString *) keyPath ofObject: (id) object change: (NSDictionary *) change context: (void *) context{
    NSLog(@"gogo");
    float height=115.0f;
    float wight=305.0f;
    NSRect r1=CGRectMake(450, 350, wight, height);
    NSRect r2=CGRectMake(450, 175, wight, height);
    NSRect r3=CGRectMake(450, 0, wight, height);
    [viewA draw:r1:modelA.A];
    [viewB draw:r2:modelB.A];
    [viewC draw:r3:[modelA doSv:modelB].A];
}
@end
