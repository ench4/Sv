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
-(id) init
{
    self=[super init];
    if (self)
    {
        value=rand()%100;
    }
    return self;
}
-(float)floatValue
{
    return value;
};
- (void) setNilValueForKey:(NSString *)key
{
    [self setValue:@0 forKey:key];
}

@end
