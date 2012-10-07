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

@implementation ViewController

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)rect
{
    NSMutableArray *A=[[NSMutableArray alloc] init];
    NSMutableArray *B=[[NSMutableArray alloc] init];
    NSMutableArray *result=[[NSMutableArray alloc] init];
    int range_A=0;
    int range_B=0;
    
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    CGContextSetLineWidth(context, 2.0f);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0f, 0.0f, 1.0f, 1.0f};
    CGColorRef color = CGColorCreate(colorspace, components);
    CGContextSetStrokeColorWithColor(context, color);
    
    int (^enterRange)(char *) = ^(char *S)
    {
        int I;
        printf("введите размер %s вектора ",S);
        scanf("%d",&I);
        return I;
    };
    
    void (^fill)(NSMutableArray*,int,char*)=^(NSMutableArray *Ar, int range,char *S)
    {
        float f=50.0f;
        float k;
        float shift=300.0f/(float)range;
        float delta=0.0f;
        printf("Заполните %s вектор\n",S);
        
        for (int i=0; i<range; ++i)
        {
            scanf("%f",&k);
            NSString* str = [NSString stringWithFormat:@"%f",k];
            [Ar addObject:str];
            if(delta<k) delta=k;
        }
        
        if(strcmp(S,"первый")==0)
        {
            delta=100/delta;
            
            for (int i=0; i<[Ar count]; i++)
            {
                if (i==0) CGContextMoveToPoint(context, f, (delta*[[Ar objectAtIndex:i] floatValue]+150.0f));
                CGContextAddLineToPoint(context,f+=shift,(delta*[[Ar objectAtIndex:i] floatValue]+150.0f));
            }
            CGContextMoveToPoint(context, f, 150.0f);
            CGContextAddLineToPoint(context,50,150);
        }
    };
    
    void (^addZero)(NSMutableArray*, int)=^(NSMutableArray *Ar, int rangeB)
    {
        float a=0.0;
        for (int i=0; i<(rangeB-1); i++)
        {
            NSString* str = [NSString stringWithFormat:@"%f",a];
            [Ar addObject:str];
        }
    };
    
    void (^doSv)(NSMutableArray*, NSMutableArray*, NSMutableArray*)=^(NSMutableArray *AA, NSMutableArray *AB, NSMutableArray *AR)
    {
        float f=50.0;
        float buf=0;
        float shift=300/(float)([AA count]);
        
        for (int z=0; z<[AA count]; z++)
        {
            for (int x=0; x<=z; x++)
            {
                buf+=[[AA objectAtIndex: x] floatValue]*[[AB objectAtIndex:(z-x)] floatValue];
            }
            
        NSString *s = [NSString stringWithFormat:@"%f",buf];
        [AR addObject:s];
        buf=0;
        }
        
        float delta=0.0f;
        
        for (int i=0; i<[AR count]; i++)
        {
            if ([[AR objectAtIndex:i] floatValue]>delta) delta = [[AR objectAtIndex:i] floatValue];
        }
        
        delta=100/delta;
        
        for (int i=0; i<[AR count]; i++)
        {
            if (i==0) CGContextMoveToPoint(context, f, (delta*[[AR objectAtIndex:i] floatValue]+15.0f));
            CGContextAddLineToPoint(context,f+=shift,(delta*[[AR objectAtIndex:i] floatValue]+15.0f));
        }
        CGContextMoveToPoint(context, f, 15.0f);
        CGContextAddLineToPoint(context,50,15);
        printf("Результирующий вектор: ");
        
        for (int k=0; k<[AR count]; ++k)
        {
            printf("%f ",[[AR objectAtIndex:k] floatValue]);
        }
    };
    
    fill(A,range_A=enterRange("первого"),"первый");
    
    fill(B,range_B=enterRange("второго"),"второй");
    
    addZero(A, range_B);
    
    addZero(B, range_A);
    
    doSv(A, B, result);
    
    CGContextStrokePath(context);
}

@end
