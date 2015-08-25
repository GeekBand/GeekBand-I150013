//
//  ApiManager+Login.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "ApiManager+Login.h"
#import "GBHSUserModel.h"

@implementation ApiManager (Login)

- (void)LoginUser:(GBHSUserModel*)user withBlock:(ScuessBlock)block
{
    [self requestJsonDataWithApiPath:@"/api/user/session" withParameters:@{} withMethodType:GBHSRequestMethodPOST isShowError:YES andBlock:^(id data, NSError *error) {
        
    }];
}
@end
