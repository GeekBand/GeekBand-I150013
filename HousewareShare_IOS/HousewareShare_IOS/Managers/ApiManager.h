//
//  ApiManager.h
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, GBHSRequestMethod)
{
    GBHSRequestMethodGET = 0,
    GBHSRequestMethodPOST,
    GBHSRequestMethodPUT,
    GBHSRequestMethodDELETE
};

typedef void (^ScuessBlock)(id data, NSError *error);


@interface ApiManager : NSObject

+ (instancetype)shareClient;

- (void)requestJsonDataWithApiPath:(NSString *)apiPath
                    withParameters:(NSDictionary*)parameters
                    withMethodType:(GBHSRequestMethod)method
                       isShowError:(BOOL)isShowError
                          andBlock:(void (^)(id data, NSError *error))block;
@end
