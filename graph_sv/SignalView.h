//
//  ViewController.h
//  graph_sv
//
//  Created by Samez on 06.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SignalView : NSView
{
    float bordersShift;
    float zero;
}

- (void)drawRect:(NSRect)rect;
@property NSMutableArray* vector;

@end
