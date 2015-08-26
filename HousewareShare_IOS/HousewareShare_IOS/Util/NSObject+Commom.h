//
//  NSObject+Commom.h
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/26.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Commom)


+ (NSError *)parseResponseWithResponseObject:(id)responseObject isShowError:(BOOL)isShowError;
+ (BOOL)ShowErrorInfomation:(NSError*)errorInfo;
- (NSString *)baseUrlString;
@end
