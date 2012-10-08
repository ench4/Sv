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
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    ViewController *a=[[ViewController alloc] initWithFrame:CGRectMake(5, 5, 600, 600)];
    Model *M=[[Model alloc] init];
    [M fillByRandom:100];
    [a drawRect:CGRectMake(15, 15, 500, 500):M.A];
    
    
    CALayer *la=[[CALayer alloc] init];
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    
    NSTableView *TV=[[NSTableView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    NSTableColumn *TC=[[NSTableColumn alloc] initWithIdentifier:@"aaa"];
    NSCell *C=[[NSCell alloc] initTextCell:@"zzzZZ"];
    [TV addTableColumn:TC];
    [TV drawCell:C];
    [TV drawLayer:la inContext:context];
    
}

@end
