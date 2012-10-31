//
//  ImmutableSignalView.m
//  graph_sv
//
//  Created by Виктор on 31.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import "MutableSignalView.h"

@implementation MutableSignalView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        needRecalc=TRUE;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    if (needRecalc){
        [super recalcBorder:dirtyRect];
    }
    [super drawRect:dirtyRect];
}
- (void) mouseUp:(NSEvent *)theEvent
{
    [super recalcBorder:[self frame]];
    [self setNeedsDisplay:YES];
    needRecalc=TRUE;
}

- (void) mouseDragged:(NSEvent *)theEvent
{
    NSNumber* val;
    NSRect frame=[self frame];
    if (frame.origin.y+bordersShift>[theEvent locationInWindow].y)
    {
        val=[NSNumber numberWithFloat:[AC.arrangedObjects[ind] floatValue]-10];
        [super recalcBorder:[self frame]];
        
    }else
        if (frame.origin.y+frame.size.height-bordersShift<[theEvent locationInWindow].y)
        {
            val=[NSNumber numberWithFloat:[AC.arrangedObjects[ind] floatValue]+10];
            [super recalcBorder:[self frame]];
        }else
        {
            ind=(([theEvent locationInWindow].x-frame.origin.x-bordersShift)/(frame.size.width-2*bordersShift))* ([super.vector count]-1)+0.5;
            val=[NSNumber numberWithFloat:(([theEvent locationInWindow].y - frame.origin.y - zero)/shift_y)];
        }
    
    
    [AC setSelectionIndexes:[[NSIndexSet alloc] initWithIndex:ind]];
    [AC setValue:val forKeyPath:@"selection.value"];
    
}
-(void) mouseDown:(NSEvent *)theEvent
{
    needRecalc=FALSE;
    NSRect frame=[self frame];
    ind=(([theEvent locationInWindow].x-frame.origin.x-bordersShift)/(frame.size.width-2*bordersShift))* ([super.vector count]-1)+0.5;
    [AC setSelectionIndexes:[[NSIndexSet alloc] initWithIndex:ind]];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay:YES];
}

@end
