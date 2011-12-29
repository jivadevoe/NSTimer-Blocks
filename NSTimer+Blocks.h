//
//  NSTimer+Blocks.h
//
//  Created by Jiva DeVoe on 1/14/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef NSTB_USE_ARC
#define NSTB_USE_ARC __has_feature(objc_arc)
#endif

#if NSTB_USE_ARC
#define NSTB_RETAIN(xx)
#define NSTB_RELEASE(xx)
#define NSTB_AUTORELEASE(xx)
#else
#define NSTB_RETAIN(xx)           [xx retain];
#define NSTB_RELEASE(xx)          [xx release];
#define NSTB_AUTORELEASE(xx)      [xx autorelease];
#endif

@interface NSTimer (Blocks)
+(id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
+(id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
@end
