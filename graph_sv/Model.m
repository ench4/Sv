//
//  Model.m
//  graph_sv
//
//  Created by Samez on 08.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import "Model.h"


@implementation Model

@synthesize A = A;

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
    for (int i=0; i<range; ++i)
    {
        NSNumber *a=[[NSNumber alloc] initWithInt:rand()%500];
        [A addObject:a];
    }
};

-(Model*)doSv:(Model*)M
{
    Model *mod=[[Model alloc] init];
    float buf;

    NSNumber *zero=[[NSNumber alloc] initWithFloat:0.0f];
    for (int i=0; i<([A count]); i++)
    {
        [A addObject:zero];
    }
    
    for (int i=0; i<([M.A count]); i++)
    {
        [M.A addObject:zero];
    }
    
    for (int z=0; z<[A count]; z++)
    {
        for (int x=0; x<=z; x++)
        {
            buf+=[[A objectAtIndex: x] floatValue]*[[M.A objectAtIndex:(z-x)] floatValue];
        }
        NSNumber *b=[[NSNumber alloc] initWithFloat:buf];
        [mod.A addObject:b];
        buf=0;
    }
    return mod;
};

@end
