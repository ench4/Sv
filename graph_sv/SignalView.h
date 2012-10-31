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
    float diameter;
    bool boldpoint;
    NSArrayController* AC;
}
<<<<<<< HEAD


=======
//1
- (void) setBoldPoint:(bool) bold;
>>>>>>> 84bb503d78254f15d6386e7e0dfb93d578cc4bbf
- (void) drawRect:(NSRect)rect;
- (void) drawPoint:(NSPoint)point :(BOOL)Bold;
- (void) recalcBorder:(NSRect) rect;
@property NSMutableArray* vector;


@end
