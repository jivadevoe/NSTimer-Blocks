//
//  NSTimer+Blocks.m
//
//  Created by Jiva DeVoe on 1/14/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import "NSTimer+Blocks.h"


NSString    *   JDTimerPlusBlocksBlockKey = @"JDTimerPlusBlocksBlockKey";


@implementation NSTimer (JDBlocks)

+(id)   scheduledTimerWithTimeInterval: (NSTimeInterval)inTimeInterval block: (void (^)())inBlock repeats: (BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval: inTimeInterval target: self selector: @selector(jdExecuteSimpleBlock:) userInfo: [NSDictionary dictionaryWithObjectsAndKeys: (id)block, JDTimerPlusBlocksBlockKey, nil] repeats: inRepeats];
#if !__has_feature(objc_arc)
    [block release];
#endif
    return ret;
}

+(id)   timerWithTimeInterval: (NSTimeInterval)inTimeInterval block: (void (^)())inBlock repeats: (BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self timerWithTimeInterval: inTimeInterval target: self selector: @selector(jdExecuteSimpleBlock:) userInfo: [NSDictionary dictionaryWithObjectsAndKeys: (id)block, JDTimerPlusBlocksBlockKey, nil] repeats: inRepeats];
#if !__has_feature(objc_arc)
    [block release];
#endif
    return ret;
}

+(void)jdExecuteSimpleBlock: (NSTimer *)inTimer
{
    void (^block)() = (void (^)())[[inTimer userInfo] objectForKey: JDTimerPlusBlocksBlockKey];
    if( block )
    {
        block();
    }
}

@end
