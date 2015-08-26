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
    // 测试GET请求
    [self requestJsonDataWithApiPath:@"/index" withParameters:@{} withMethodType:GBHSRequestMethodGET isShowError:YES andBlock:^(id data, NSError *error) {
        NSLog(@"1：请求数据成功!");
        if (data) {
            if ([data isKindOfClass:[NSDictionary class]]) {
                NSLog(@"请求的数据为:%@", [data description]);
            }
        }
        else
        {
            NSLog(@"请求数据失败的情况!");
        }
        NSLog(@"\r\n\r\n\r\n");
    }];
    
    
    // 测试Get请求的所有情况
    [self requestJsonDataWithApiPath:@"/method/code/2/msg/scuess?w=share&m=get" withParameters:@{} withMethodType:GBHSRequestMethodGET isShowError:YES andBlock:^(id data, NSError *error) {
        if (data) {
            NSLog(@"2:GBHSRequestMethodGET 请求数据成功!");
            if ([data isKindOfClass:[NSDictionary class]]) {
                NSLog(@"请求的数据为:%@", [data description]);
            }
        }
        else
        {
            NSLog(@"请求数据失败的情况!");
        }
        NSLog(@"\r\n\r\n\r\n");
    }];
    
    
    [self requestJsonDataWithApiPath:@"/method/code/0/msg/scuess?w=share&m=post" withParameters:@{@"who":@"xiao ming", @"what":@"helloworld!"} withMethodType:GBHSRequestMethodPOST isShowError:YES andBlock:^(id data, NSError *error) {
        NSLog(@"3:GBHSRequestMethodPOST 请求数据成功!");
        if (data) {
            
            if ([data isKindOfClass:[NSDictionary class]]) {
                NSLog(@"请求的数据为:%@", [data description]);
            }
        }
        else
        {
            NSLog(@"请求数据失败的情况!");
        }
        NSLog(@"\r\n\r\n\r\n");
    }];
    
    
    [self requestJsonDataWithApiPath:@"/method/code/0/msg/scuess?w=share&m=put" withParameters:@{@"who":@"xiao ming", @"what":@"helloworld!"} withMethodType:GBHSRequestMethodPUT isShowError:YES andBlock:^(id data, NSError *error) {
        NSLog(@"4:GBHSRequestMethodPUT请求数据成功!");
        if (data) {
            
            if ([data isKindOfClass:[NSDictionary class]]) {
                NSLog(@"请求的数据为:%@", [data description]);
            }
        }
        else
        {
            NSLog(@"请求数据失败的情况!");
        }
        NSLog(@"\r\n\r\n\r\n");
    }];
    
    
    [self requestJsonDataWithApiPath:@"/method/code/0/msg/scuess?w=share&m=delete" withParameters:@{} withMethodType:GBHSRequestMethodDELETE isShowError:YES andBlock:^(id data, NSError *error) {
        NSLog(@"5:GBHSRequestMethodDELETE请求数据成功!");
        if (data) {
            if ([data isKindOfClass:[NSDictionary class]]) {
                NSLog(@"请求的数据为:%@", [data description]);
            }
        }
        else
        {
            NSLog(@"请求数据失败的情况!");
        }
        NSLog(@"\r\n\r\n\r\n");
    }];
}
@end
