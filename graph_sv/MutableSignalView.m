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
        canDrag=NO;
       
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
    canDrag=NO;
    [super recalcBorder:[self frame]];
    [self setNeedsDisplay:YES];
    needRecalc=TRUE;
}

- (void) mouseDragged:(NSEvent *)theEvent
{
    [self select:theEvent];
    NSNumber* val=[NSNumber numberWithFloat:[AC.arrangedObjects[ind] floatValue]];
    if(canDrag)
    {
        if ([self frame].origin.y+bordersShift>[theEvent locationInWindow].y)
        {
            val=[NSNumber numberWithFloat:[AC.arrangedObjects[ind] floatValue]-10];
            [super recalcBorder:[self frame]];
        }else
            if ([self frame].origin.y+[self frame].size.height-bordersShift<[theEvent locationInWindow].y)
            {
                val=[NSNumber numberWithFloat:[AC.arrangedObjects[ind] floatValue]+10];
                [super recalcBorder:[self frame]];
            }else
                {
                    val=[NSNumber numberWithFloat:(([theEvent locationInWindow].y - [self frame].origin.y - zero)/shift_y)];
                }
    }
    
    [AC setValue:val forKeyPath:@"selection.value"];
    
}
- (void)select:(NSEvent *)theEvent
{
    ind=(([theEvent locationInWindow].x-[self frame].origin.x-bordersShift)/([self frame].size.width-2*bordersShift))* ([super.vector count]-1)+0.5;
    if (ind<0)
    {
        ind=0;
    }else
    if (ind>[[AC arrangedObjects] count]-1){
        ind=[AC.arrangedObjects count]-1;
    }
    [AC setSelectionIndexes:[[NSIndexSet alloc] initWithIndex:ind]];
}

-(void) mouseDown:(NSEvent *)theEvent
{
    needRecalc=FALSE;
    
    [self select:theEvent];
    
    float positionX=([self frame].size.width-2*bordersShift-leftPadding)/([super.vector count]-1)*ind;
    float positionY=(shift_y*([super.vector[ind] floatValue]-min)+bordersShift);
    
    if (fabs(positionX-([theEvent locationInWindow].x-[self frame].origin.x-bordersShift-leftPadding))<(diameter)
        && fabs(positionY-([theEvent locationInWindow].y-[self frame].origin.y))<(diameter))
            {
                canDrag=YES;
            }
    
    [AC setSelectionIndexes:[[NSIndexSet alloc] initWithIndex:ind]];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay:YES];
}

@end
