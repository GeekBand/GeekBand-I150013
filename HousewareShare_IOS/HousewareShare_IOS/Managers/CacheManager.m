//
//  CacheManager.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/26.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "CacheManager.h"
#import "GBHSUserModel.h"

NSString * const kCacheDirName = @"kCacheDirName";

@implementation CacheManager

/**
 *  缓存单例
 *
 *  @return 缓存单例
 */
+ (instancetype)shareManager
{
    static CacheManager *_shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[CacheManager alloc] init];
    });
    
    return _shareManager;
}

/**
 *  创建缓存管理器
 *
 *  @return 缓存管理器实例
 */
- (instancetype)init
{
    return [[CacheManager alloc] initWithCacheDirName:kCacheDirName];
}


/**
 *  获取缓存目录
 *
 *  @return 缓存目录
 */
- (NSString*)cacheDirName
{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}


/**
 *  获取缓存目录下的文件路径
 *
 *  @param fileName 文件名称
 *
 *  @return 文件路径
 */
- (NSString*)cachePathWith:(NSString*)fileName
{
    return [[self cacheDirName] stringByAppendingPathComponent:fileName];
}

/**
 *  使用UserDefault保存缓存数据
 *
 *  @param value 保存的数据
 *  @param key   索引
 */
- (void)setUserDefaultObject:(id)value forKey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setObject:key forKey:value];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *  从UserDefault获取缓存数据
 *
 *  @param key 索引
 *
 *  @return 缓存的数据
 */
- (id)getUserDefaultObjectForKey:(NSString*)key
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}


/**
 *  通过缓存目录创建缓存管理器
 *
 *  @param dirName 缓存目录
 *
 *  @return 缓存管理器实例
 */
- (instancetype)initWithCacheDirName:(NSString*)dirName
{
    self = [super init];
    if (self) {
        if ([dirName length] <= 0) {
            NSLog(@"创建缓存目录时,传递的参数错误!");
            return self;
        }
        
        NSString * cacheRootName = [self cachePathWith:dirName];
        BOOL isDir = NO;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL existed = [fileManager fileExistsAtPath:cacheRootName isDirectory:&isDir];
        
        isDir || existed || [fileManager createDirectoryAtPath:cacheRootName withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return self;
}

/**
 *  添加缓存
 *
 *  @param data 缓存数据
 *  @param key  缓存Key
 *
 *  @return 是否增加成功
 */
- (BOOL)setCacheObject:(id)data forKey:(NSString*)key
{
    if (!key && [key length] <= 0) {
        return NO;
    }
    
    // TODO:暂时用虚拟的用户代替,后续用当前登录的用户代替
    GBHSUserModel * user = [[GBHSUserModel alloc] init];
    user.userName = @"test";
    NSString *abslutePath = [NSString stringWithFormat:@"%@/%@.plist", [self cachePathWith:kCacheDirName], [user primaryKey]];
    return [data writeToFile:abslutePath atomically:YES];
}


/**
 *  通过key获取缓存数据
 *
 *  @param key 缓存Key
 *
 *  @return key对应的缓存数据
 */
- (id)getCacheObjectForKey:(NSString*)key
{
    if (!key && [key length] <= 0) {
        return nil;
    }
    
    // TODO:暂时用虚拟的用户代替,后续用当前登录的用户代替
    GBHSUserModel * user = [[GBHSUserModel alloc] init];
    user.userName = @"test";
    NSString *abslutePath = [NSString stringWithFormat:@"%@/%@.plist", [self cachePathWith:kCacheDirName], [user primaryKey]];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:abslutePath]) {
        return nil;
    }
    
    return [NSDictionary dictionaryWithContentsOfFile:abslutePath];
}


/**
 *  通过key删除缓存数据
 *
 *  @param key 缓存的Key
 *
 *  @return 是否删除缓存成功
 */
- (BOOL)removeCacheObjectForKey:(NSString*)key
{
    return true;
}

/**
 *  清除所有的缓存
 *
 *  @return 是否成功删除所有缓存
 */
- (BOOL)clear
{
    return true;
}


@end
