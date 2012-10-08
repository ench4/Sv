//
//  AppDelegate.m
//  graph_sv
//
//  Created by Samez on 06.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate
@synthesize text = text_;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    ViewController *a=[[ViewController alloc] initWithFrame:CGRectMake(5, 5, 600, 600)];
    [a drawRect:CGRectMake(15, 15, 500, 500)];
    text_.floatValue=99;

    
}

@end
