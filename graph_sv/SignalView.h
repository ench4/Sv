//
//  ViewController.h
//  graph_sv
//
//  Created by Samez on 06.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "myType.h"

@interface SignalView : NSView
{
    float bordersShift;
    float zero;
    float min;
    float max;
    float shift_y;
    float shift_x;
    int ind;
    NSArrayController* AC;
}
// ВИТЬКА НУУУБ!!!

- (void) drawRect:(NSRect)rect;
- (void) drawPoint:(NSPoint)point;
- (void) recalcBorder:(NSRect) rect;
@property NSMutableArray* vector;


@end
