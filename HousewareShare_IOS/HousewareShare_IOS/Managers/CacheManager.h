//
//  CacheManager.h
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/26.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

+ (instancetype)shareManager;

- (void)setUserDefaultObject:(id)value forKey:(NSString*)key;
- (id)getUserDefaultObjectForKey:(NSString*)key;

- (BOOL)setCacheObject:(id)data forKey:(NSString*)key;
- (id)getCacheObjectForKey:(NSString*)key;
- (BOOL)removeCacheObjectForKey:(NSString*)key;
- (BOOL)clear;
@end
