//
//  SpeedTester.m
//  SpeedTesterTest
//
//  Created by dev2jyon on 2014/03/18.
//  Copyright (c) 2014年 jyon. All rights reserved.
//

#import "SpeedTester.h"

@implementation SpeedTester

static NSMutableArray *keyArray;

+(void)start:(NSString*)key{
#ifdef DEBUG
    
    if(!keyArray){
        keyArray = [[NSMutableArray alloc] init];
    }
    
    NSDate *date = [[NSDate alloc] init];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:date forKey:key];
    [ud synchronize];
#endif
}

+(void)lap:(NSString*)key WithComment:(NSString*)comment{
#ifdef DEBUG
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDate *date = [ud objectForKey:key];
    NSLog(@"%@ - %@ : %f", key, comment, [date timeIntervalSinceNow]);
#endif
}

+(void)lapAndEnd:(NSString*)key WithComment:(NSString*)comment{
#ifdef DEBUG
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *cmt = [NSString stringWithFormat:@"%@%@", comment, @" / measure end"];
    [SpeedTester lap:key WithComment:cmt];
    [ud removeObjectForKey:key];
    [ud synchronize];
    if(keyArray){
        [keyArray removeObject:key];
    }
#endif
}

+(void)clearAll{
#ifdef DEBUG
    if(!keyArray){
        return;
    }

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    for(NSString* key in keyArray){
        [ud removeObjectForKey:key];
        [keyArray removeObject:key];
        NSLog(@"key: [%@] removed", key);
   
    }
    [ud synchronize];

#endif
}
@end
