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
    //IBOutlet NSTextField *textField;
}
@property NSMutableArray *vector;

-(id)init;
-(void)fillByRandom:(int)range;
-(Model*)doSv:(Model*)M;

@end
