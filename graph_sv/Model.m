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

@synthesize vector;

-(id)init
{
    self=[super init];
    if(self)
    {
        vector=[[NSMutableArray alloc] init];
    }
    return self;
}; //init

-(void)fillByRandom:(int)range
{
    NSMutableArray* t=[[NSMutableArray alloc] init];
    for (int i=0; i<range; ++i)
    {
        myType *m=[[myType alloc] initWithFloat:rand()%10];
        [t addObject:m];
        //self.A=t;
        
    }
    self.vector=t;
    
}; //fillByRandom

-(Model*)doSv:(Model*)M
{
    Model *mod=[[Model alloc] init];
    float buf=0;

    NSMutableArray *wzA=[[NSMutableArray alloc] initWithArray:vector];
    NSMutableArray *wzM=[[NSMutableArray alloc] initWithArray:M.vector];
    
    for (int i=0; i<([wzM count]); i++)
    {
        [wzA addObject:@0];
    }
    
    for (int i=0; i<([wzA count]); i++)
    {
        [wzM addObject:@0];
    }
    
    for (int z=0; z<[wzA count]-1; z++)
    {
        for (int x=0; x<=z; x++)
        {
            buf+=[[wzA objectAtIndex:x] floatValue]*[[wzM objectAtIndex:(z-x)] floatValue];
        }
        myType *m=[[myType alloc] initWithFloat:buf];
        [mod.vector addObject:m];
        buf=0;
    }
    for (int i=0; i<[mod.vector count]; i++ )
    {
       // NSLog(@"%ld",[mod.vector count]);
    }
    return mod;
}; //doSv
@end
