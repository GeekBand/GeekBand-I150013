//
//  ApiManager.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//


#import "ApiManager.h"
#import <AFNetworking.h>

@interface ApiManager()

@property (nonatomic, strong) AFHTTPRequestOperationManager* _manager;

@end

@implementation ApiManager


/**
 *  请求单例
 *
 *  @return 返回请求单例
 */
+ (instancetype)shareClient
{
    static ApiManager * _client = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _client = [[ApiManager alloc] init];
    });
    
    return _client;
}

/**
 *  初始化函数
 *
 *  @return 请求对象
 */
- (instancetype)init
{
    return [[ApiManager alloc] initWithBaseUrl:@"http://127.0.0.1:5000"];
}

/**
 *  通过请求基址初始化请求对象
 *
 *  @param baseUrl 请求基址
 *
 *  @return 请求对象
 */
- (instancetype)initWithBaseUrl:(NSString*)baseUrl
{
    self = [super init];
    if(self)
    {
        self._manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[[NSURL alloc] initWithString:baseUrl]];
        
        //设置请求信息
        AFJSONRequestSerializer * requestSerializer = [[AFJSONRequestSerializer alloc] init];
        [requestSerializer  setValue:@"application/json" forKey:@"Accept"];
        [requestSerializer  setValue:@"客户端" forKey:@"Referer"];
        self._manager.requestSerializer = requestSerializer;
        
        //设置响应信息
        AFJSONResponseSerializer * responseSerializer = [[AFJSONResponseSerializer alloc] init];
        [responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil]];
        self._manager.responseSerializer = responseSerializer;
        
        self._manager.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}


/**
 *  请求数据的唯一接口
 *
 *  @param apiPath     请求接口除了基地址之外的所有部分
 *  @param parameters  GET参数
 *  @param method      请求方法[包括:GET,PUT,POST,DELETE]
 *  @param isShowError 是否显示错误
 *  @param block       请求之后的回调
 */
- (void)requestJsonDataWithApiPath:(NSString *)apiPath
                     withParameters:(NSDictionary*)parameters
                 withMethodType:(GBHSRequestMethod)method
                  isShowError:(BOOL)isShowError
                       andBlock:(void (^)(id data, NSError *error))block
{
    if (!apiPath || apiPath.length <= 0) {
        return;
    }
    apiPath = [apiPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //TODO:后续添加缓存数据,请求过期,请求错误,错误日记等处理,状态栏网络请求的提示。
    switch (method)
    {
        case GBHSRequestMethodGET:
        {
            [self._manager GET:apiPath
                    parameters:parameters
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           block(responseObject, nil);
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           block(nil, nil);
                       }];
            break;
        }
            
        case GBHSRequestMethodPOST:
        {
            [self._manager GET:apiPath
                    parameters:parameters
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           block(responseObject, nil);
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           block(nil, nil);
                       }];
            break;
        }
            
        case GBHSRequestMethodPUT:
        {
            [self._manager GET:apiPath
                    parameters:parameters
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           block(responseObject, nil);
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           block(nil, nil);
                       }];
            break;
        }
            
        case GBHSRequestMethodDELETE:
        {
            [self._manager GET:apiPath
                    parameters:parameters
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           block(responseObject, nil);
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           block(nil, nil);
                       }];
            break;
        }
    }
}




@end
