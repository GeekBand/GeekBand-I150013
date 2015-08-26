//
//  GBHSUserModel.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "GBHSUserModel.h"
#import "NSString+Commom.h"

@implementation GBHSUserModel

+ (NSDictionary*)JSONKeyPathsByPropertyKey{
    return @{};
}

/**
 *  用户唯一标识
 *
 *  @return 用户唯一标识
 */
- (NSString*)primaryKey
{
    return [_userName md5String];
}


- (BOOL)isLogin
{
    return true;
}
@end
