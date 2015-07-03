//
//  GBHSUserModel.h
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>

typedef NS_ENUM(NSUInteger, GBHSUserGender)
{
    GBHSUserGenderMale = 0,
    GBHSUserGenderFemale
};

@interface GBHSUserModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * userLocalName;
@property (nonatomic, strong) NSString * userPhoneNumber;
@property (nonatomic, strong) NSString * userMail;
@property (nonatomic, strong) NSString * userPassword;
@property (nonatomic, assign) GBHSUserGender userGender;

- (BOOL)isLogin;
- (NSString*)primaryKey;
@end
