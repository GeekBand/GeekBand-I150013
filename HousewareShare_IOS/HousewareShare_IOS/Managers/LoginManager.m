//
//  LoginManager.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/27.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "LoginManager.h"
#import "CacheManager.h"
#import "GBHSUserModel.h"

NSString * const kCacheKeyForLoginUser = @"kCacheKeyForLoginUser";

@implementation LoginManager


- (void)doLogin:(GBHSUserModel *)currentUser
{
}


- (void)doLogout:(GBHSUserModel *)currentUser
{
    
}


/**
 *  返回当前登录的用户实例
 *
 *  @return 登录用户
 */
+ (GBHSUserModel*)currentLoginUser
{
    return [[CacheManager shareManager] getUserDefaultObjectForKey:kCacheKeyForLoginUser];
}
@end
