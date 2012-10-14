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

#import "ViewController.h"
#import "TextController.h"

@implementation ViewController

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)draw:(NSRect)rect:(NSArray*) A
{
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
    NSFrameRectWithWidth ( rect, 1 );
    
    float shift=300.0f/[A count];
    float delta=0.0f;
    float f=0.0f;
    
    for (int i=0; i<[A count]; i++)
    {
        if (delta < [[A objectAtIndex:i] floatValue]) delta=[[A objectAtIndex:i] floatValue];
    }
    delta=100/delta;
            
    for (int i=0; i<[A count]; i++)
    {
        if (i==0) CGContextMoveToPoint(context, rect.origin.x+f, (delta*[[A objectAtIndex:i] floatValue]+rect.origin.y));
        CGContextAddLineToPoint(context,rect.origin.x+f,(delta*[[A objectAtIndex:i] floatValue]+rect.origin.y));
        f+=shift;
    }
 
    CGContextStrokePath(context);
}


-(void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    
};
@end
