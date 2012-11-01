//
//  ImmutableSignalView.h
//  graph_sv
//
//  Created by Виктор on 31.10.12.
//  Copyright (c) 2012 Samez. All rights reserved.
//

#import "SignalView.h"

@interface MutableSignalView : SignalView
{
    BOOL needRecalc;
    BOOL canDrag;
}

- (int)setInd:(float)forInd;
@end
