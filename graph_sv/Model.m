//
//  Model.m
//  graph_sv
//
//  Created by Samez on 08.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import "Model.h"


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
};

-(void)fillByRandom:(int)range
{
    NSMutableArray* t=[[NSMutableArray alloc] init];
    for (int i=0; i<range; ++i)
    {
        NSNumber *a=[[NSNumber alloc] initWithFloat:rand()%500];
        [t addObject:a];
        //self.a=t;
    }
    self.A=t;
    
};

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
        NSNumber* str = [[NSNumber alloc] initWithFloat:k];
        [t addObject:str];
    }
    self.A=t;
}

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
    
    for (int z=0; z<[wzA count]; z++)
    {
        for (int x=0; x<=z; x++)
        {
            buf+=[[wzA objectAtIndex: x] floatValue]*[[wzM objectAtIndex:(z-x)] floatValue];
        }
        NSNumber *b=[[NSNumber alloc] initWithFloat:buf];
        [mod.A addObject:b];
        buf=0;
    }
    return mod;
};

@end
