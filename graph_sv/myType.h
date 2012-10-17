//
//  myType.h
//  graph_sv
//
//  Created by Samez on 17.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myType : NSObject
{
    float value;
}
@property float value;

-(id)initWithFloat:(float)v;
-(float)floatValue;
-(void)setFloatValue:(float)v;

@end 
