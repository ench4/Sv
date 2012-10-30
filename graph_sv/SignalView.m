//
//  ViewController.m
//  graph_sv
//
//  Created by Samez on 06.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//
/*
 
 2	20	35	49	83	1	18	93	3	19	44	11	53	7	66	6	45	25	5	16	24	38	89	100	77	88	10	19	56	1
 
 */

#import "SignalView.h"

@implementation SignalView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        zero=0;
        bordersShift=15;
        currPoint.x=-15.0f;
        currPoint.y=-15.0f;
        min=0.0f;
        max=0.0f;
        shift_y=0.0f;
        shift_x=0.0f;
        ind=0;
    }
    return self;
}
@synthesize vector;

-(void) drawPoint
{
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    [[NSColor whiteColor] set];
    CGRect currRect={currPoint.x-3,currPoint.y-3,6,6};

    NSBezierPath *circle=[NSBezierPath bezierPathWithOvalInRect:currRect];
    [circle fill];
    CGContextStrokePath(context);
}

- (void)drawRect:(NSRect)rect
{
    if ([vector count]<2){
        return;
    }
    
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    CGContextSetLineWidth(context, 2.0f);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0f, 0.0f, 1.0f, 1.0f};
    CGColorRef color = CGColorCreate(colorspace, components);
    CGContextSetStrokeColorWithColor(context, color);

    NSColor * blue = [NSColor blueColor];
    NSColor * gray = [NSColor lightGrayColor];
    [gray set];
    NSRectFill(rect);
    [blue set];
    
    NSFrameRectWithWidth (rect, 1);

    max=[vector[0] floatValue];
    min=[vector[0] floatValue];
    for (int i=1; i<[vector count]; i++)
    {
        if (max < [[vector objectAtIndex:i] floatValue]) max=[[vector objectAtIndex:i] floatValue];
        if (min > [[vector objectAtIndex:i] floatValue])
            min=[[vector objectAtIndex:i] floatValue];
    }
    
    shift_x=(rect.size.width-bordersShift*2)/([vector count]-1);
    shift_y=(rect.size.height-bordersShift*2)/(max-min);
    
    zero=-min*shift_y+bordersShift;
    CGContextMoveToPoint(context, bordersShift, zero);
    CGContextAddLineToPoint(context, rect.size.width-bordersShift, zero);
    
    float currX=bordersShift;
    
    for (int i=0; i<[vector count]; i++)
    {
        if (i==0) CGContextMoveToPoint(context, currX, (shift_y*([vector [i] floatValue]-min)+bordersShift));
        CGContextAddLineToPoint(context,currX,(shift_y*([vector[i] floatValue]-min)+bordersShift));

        currX+=shift_x;
    }
    
    CGContextStrokePath(context);
    
    currX=bordersShift;
    
    for (int i=0; i<[vector count]; i++)
    {
        currPoint.x=(shift_x*i+bordersShift);
        currPoint.y=(shift_y*([vector[i] floatValue]-min)+bordersShift);
        currX+=shift_x;
        [self drawPoint];
    }
    
} //drawRect

-(void) mouseDown:(NSEvent *)theEvent
{
    NSRect frame=[self frame];
    ind=(([theEvent locationInWindow].x-frame.origin.x-bordersShift)/(frame.size.width-2*bordersShift))* ([vector count]-1)+0.5;
    [AC setSelectionIndexes:[[NSIndexSet alloc] initWithIndex:ind]];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay:YES];
}

- (void) bind:(NSString *)binding toObject:(id)observable withKeyPath:(NSString *)keyPath options:(NSDictionary *)options
{
    AC=observable;
    [super bind:binding toObject:observable withKeyPath:keyPath options:options];
    [self setNeedsDisplay:YES];
}

- (void) mouseDragged:(NSEvent *)theEvent
{
    NSNumber* val;
    NSRect frame=[self frame];
    if (frame.origin.y+bordersShift>[theEvent locationInWindow].y)
    {
        val=[NSNumber numberWithFloat:[AC.arrangedObjects[ind] floatValue]-10];
    }else
    if (frame.origin.y+frame.size.height-bordersShift<[theEvent locationInWindow].y)
    {
        val=[NSNumber numberWithFloat:[AC.arrangedObjects[ind] floatValue]+10];
    }else{
        ind=(([theEvent locationInWindow].x-frame.origin.x-bordersShift)/(frame.size.width-2*bordersShift))* ([vector count]-1)+0.5;
        
        currPoint.x=frame.origin.x+(shift_x*ind+bordersShift);
        val=[NSNumber numberWithFloat:(([theEvent locationInWindow].y - frame.origin.y - zero)/shift_y)];
    }
    

    [AC setSelectionIndexes:[[NSIndexSet alloc] initWithIndex:ind]];
    [AC setValue:val forKeyPath:@"selection.value"];

}

@end 
