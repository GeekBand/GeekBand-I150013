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
- (BOOL)addCacheWithData:(id)data forKey:(NSString*)key;
- (id)getCacheForKey:(NSString*)key;
- (BOOL)removeCacheForKey:(NSString*)key;
- (BOOL)clear;
@end
