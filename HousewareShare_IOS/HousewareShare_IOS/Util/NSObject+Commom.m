//
//  NSObject+Commom.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/26.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "NSObject+Commom.h"

/**
 *  响应代码枚举变量
 */
typedef NS_ENUM(NSUInteger, GBHSResponseCode){
    /**
     *  请求成功
     */
    GBHSResponseCodeScuess = 0
};

@implementation NSObject (Commom)


/**
 *  从服务端获取的response字典中解析,返回的数据。
 *
 *  @param responseObject 服务器接口返回的数据
 *  @param isShowError     是否显示错误信息
 *
 *  @return 返回错误的对象NSError
 */
+ (NSError *)parseResponseWithResponseObject:(id)responseObject isShowError:(BOOL)isShowError
{
    NSError * error = nil;
    
    //  通常服务端返回的字典用code代表错误代码
    NSNumber* errorCode = [responseObject objectForKey:@"code"];
    NSLog(@"返回的错误代码为%@", errorCode);
    if ([errorCode unsignedIntegerValue] == GBHSResponseCodeScuess) {
        return error;
    }
    
    //TODO:请求过期,请求错误,错误日记等处理
    error = [NSError errorWithDomain:[NSObject baseUrlString] code:[errorCode unsignedIntegerValue] userInfo:responseObject];
    
    isShowError && [NSObject ShowErrorInfomation:error];
    return error;
}


/**
 *  通过界面显示错误信息提示用户
 *
 *  @param errorInfo 错误信息
 */
+ (BOOL)ShowErrorInfomation:(NSError*)errorInfo
{
    if (errorInfo) {
        NSLog(@"请求发生错误!!!");
    }
    
    return true;
}


/**
 *  服务器地址
 *
 *  @return 服务器地址
 */
- (NSString*)baseUrlString
{
    return @"http://127.0.0.1:5000";
}
@end
