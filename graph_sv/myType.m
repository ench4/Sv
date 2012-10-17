//
//  myType.m
//  graph_sv
//
//  Created by Samez on 17.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import "myType.h"

@implementation myType
@synthesize value;

-(id)initWithFloat:(float)v
{
    self=[super init];
    if (self)
    {
        value=v;
    }
    return self;
};

-(float)floatValue
{
    return value;
};

-(void)setFloatValue:(float)v
{
    value=v;
}


@end
