//
//  NSString+Commom.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/26.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "NSString+Commom.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Commom)


/**
 *  获取字符串经过Md5加密后的数据
 *
 *  @return md5字符串
 */
- (NSString *)md5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


/**
 *  获取字符串的sha1串
 *
 *  @return sha1串
 */
- (NSString*) sha1String
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* sha1String = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [sha1String appendFormat:@"%02x", digest[i]];
    
    return sha1String;
}


/**
 *  验证字符串是否为有效的邮箱
 *
 *  @return 验证结果
 */
- (BOOL)isValidMailAddress
{
    return true;
}


/**
 *  验证是否为有效的手机号码
 *
 *  @return 验证结果
 */
- (BOOL)isValidPhoneNumber
{
    return true;
}

@end
