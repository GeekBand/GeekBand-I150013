//
//  ApiManager+Login.h
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "ApiManager.h"
@class GBHSUserModel;

@interface ApiManager (Login)

- (void)doLoginWithUser:(GBHSUserModel*)loginuser withBlock:(ScuessBlock)block;
@end
