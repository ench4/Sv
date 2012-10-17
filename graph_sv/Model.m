//
//  Model.m
//  graph_sv
//
//  Created by Samez on 08.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import "Model.h"
#import "myType.h"

@implementation Model

@synthesize A;// = A;

-(id)init
{
    self=[super init];
    if(self)
    {
        A=[[NSMutableArray alloc] init];
    }
    return self;
}; //init
 
-(void)setArray:(NSArray*)M
{
    self.A=[[NSMutableArray alloc] initWithArray:M];
}; //setArray

-(void)fillByRandom:(int)range
{
    NSMutableArray* t=[[NSMutableArray alloc] init];
    for (int i=0; i<range; ++i)
    {
        myType *m=[[myType alloc] initWithFloat:rand()%10];
        [t addObject:m];
        //self.A=t;
        
    }
    self.A=t;
    
}; //fillByRandom

-(void)manualFill
{
    int range;
    NSMutableArray* t=[[NSMutableArray alloc] init];
    printf("Введите размер вектора: ");
    scanf("%d",&range);
    float k;
    printf("Заполните вектор\n");
    for (int i=0; i<range; ++i)
    {
        scanf("%f",&k);
        myType *m=[[myType alloc] initWithFloat:k];
        [t addObject:m];
    }
    self.A=t;
} //manualFill

-(Model*)doSv:(Model*)M
{
    Model *mod=[[Model alloc] init];
    float buf;

    NSNumber *zero=[[NSNumber alloc] initWithFloat:0.0f];
    NSMutableArray *wzA=[[NSMutableArray alloc] initWithArray:A];
    NSMutableArray *wzM=[[NSMutableArray alloc] initWithArray:M.A];
    
    for (int i=0; i<([wzM count]); i++)
    {
        [wzA addObject:zero];
    }
    
    for (int i=0; i<([wzA count]); i++)
    {
        [wzM addObject:zero];
    }
    
    for (int z=0; z<[wzA count]-1; z++)
    {
        for (int x=0; x<=z; x++)
        {
            buf+=[[wzA objectAtIndex:x] floatValue]*[[wzM objectAtIndex:(z-x)] floatValue];
        }
        myType *m=[[myType alloc] initWithFloat:buf];
        [mod.A addObject:m];
        buf=0;
    }
    return mod;
}; //doSv

@end
