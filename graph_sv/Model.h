//
//  Model.h
//  graph_sv
//
//  Created by Samez on 08.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
{
    IBOutlet NSMutableArray *A;
}
@property (retain) NSMutableArray *A;

-(id)init;
-(void)setArray:(NSArray*)M;
-(void)fillByRandom:(int)range;
-(void)manualFill;
-(Model*)doSv:(Model*)M;

@end
