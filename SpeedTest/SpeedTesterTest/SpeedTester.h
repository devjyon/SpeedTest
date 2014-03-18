//
//  SpeedTester.h
//  SpeedTesterTest
//
//  Created by dev2jyon on 2014/03/18.
//  Copyright (c) 2014年 jyon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpeedTester : NSObject

+(void)start:(NSString*)key;
+(void)lap:(NSString*)key WithComment:(NSString*)comment;
+(void)lapAndEnd:(NSString*)key WithComment:(NSString*)comment;

+(void)clearAll;

@end
