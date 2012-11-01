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
        min=0.0f;
        max=0.0f;
        shift_y=0.0f;
        shift_x=0.0f;
        ind=-1;
        diameter=6.0f;
        boldpoint=NO;
    }
    return self;
}
@synthesize vector;

-(void) drawPoint:(NSPoint) currPoint :(BOOL) Bold
{
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    
    if(Bold)
    {
        [[NSColor redColor] set];
        diameter*=1.5;
    } else
    {
        [[NSColor whiteColor] set];
        diameter=6;
    }
    
    
    CGRect currRect={currPoint.x-(diameter/2),currPoint.y-(diameter/2),diameter,diameter};
    NSBezierPath *circle=[NSBezierPath bezierPathWithOvalInRect:currRect];
    [circle fill];
    CGContextStrokePath(context);
    
    diameter=6;
}

- (void)recalcBorder:(NSRect)rect
{
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
    
    
    NSFrameRectWithWidth (rect, 1);
    [[NSColor blackColor] set];
    CGContextMoveToPoint(context, 0, zero);
    CGContextAddLineToPoint(context, rect.size.width, zero);
    CGContextStrokePath(context);
    [blue set];
    float currX=bordersShift;
    
    for (int i=0; i<[vector count]; i++)
    {
        if (i==0) CGContextMoveToPoint(context, currX, (shift_y*([vector [i] floatValue]-min)+bordersShift));
        CGContextAddLineToPoint(context,currX,(shift_y*([vector[i] floatValue]-min)+bordersShift));

        currX+=shift_x;
    }
    
    CGContextStrokePath(context);
    
    currX=bordersShift;
    NSPoint point;
    
    for (int i=0; i<[vector count]; i++)
    {
        point.x=shift_x*i+bordersShift;
        point.y=shift_y*([vector[i] floatValue]-min)+bordersShift;

        currX+=shift_x;
        
        if ((i==ind) && boldpoint) [self drawPoint:point :YES];
            else [self drawPoint:point :NO];
    }
    
} //drawRect

- (void) setBoldPoint:(bool) bold
{
    boldpoint=bold;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self recalcBorder:self.frame];
    [self setNeedsDisplay:YES];
}

- (void) bind:(NSString *)binding toObject:(id)observable withKeyPath:(NSString *)keyPath options:(NSDictionary *)options
{
    AC=observable;
    [super bind:binding toObject:observable withKeyPath:keyPath options:options];
    [self recalcBorder:[self frame]];
    [self setNeedsDisplay:YES];
}


@end 
