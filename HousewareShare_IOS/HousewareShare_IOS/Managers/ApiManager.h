//
//  ApiManager.h
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  api接口请求方法的枚举值
 */
typedef NS_ENUM(NSUInteger, GBHSRequestMethod){
    GBHSRequestMethodGET = 0,
    GBHSRequestMethodPOST,
    GBHSRequestMethodPUT,
    GBHSRequestMethodDELETE
};


typedef void (^ScuessBlock)(id data, NSError *error);


@interface ApiManager : NSObject

+ (instancetype)shareClient;

- (void)setRequestHeaderValue:(id)value withKey:(NSString*)key;
- (void)requestJsonDataWithApiPath:(NSString *)apiPath
                    withParameters:(NSDictionary*)parameters
                    withMethodType:(GBHSRequestMethod)method
                       isShowError:(BOOL)isShowError
                          andBlock:(ScuessBlock)block;
@end
