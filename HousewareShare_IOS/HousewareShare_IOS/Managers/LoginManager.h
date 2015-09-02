//
//  LoginManager.h
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/27.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GBHSUserModel;

@interface LoginManager : NSObject

@property (nonatomic, strong) NSString *userName, *mailAddress, *phoneNumber;
@property (nonatomic, assign, getter=isRemember) BOOL remember;
@property (nonatomic, strong) NSString *identityCode;

- (void)doLogin:(GBHSUserModel*)currentUser;
- (void)doLogout:(GBHSUserModel*)currentUser;
+ (GBHSUserModel*)currentLoginUser;
@end
