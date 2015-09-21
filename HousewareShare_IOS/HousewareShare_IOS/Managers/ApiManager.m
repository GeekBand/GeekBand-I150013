//
//  ApiManager.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//
#import <AFNetworking.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "CacheManager.h"
#import "NSObject+Commom.h"
#import "ApiManager.h"
#import "macro.h"

@interface ApiManager()

@property (nonatomic, strong) AFHTTPRequestOperationManager* _manager;
@property (nonatomic, strong) NSDictionary * defaulRequestHeaders;

- (instancetype)init;
- (instancetype)initWithBaseUrl:(NSString*)baseUrl;
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
    return [[ApiManager alloc] initWithBaseUrl:[NSObject baseUrlString]];
}


/**
 *  默认的头部信息
 *
 *  @return 头部信息
 */
- (NSDictionary*)defaulRequestHeaders
{
    if (!_defaulRequestHeaders) {
        _defaulRequestHeaders = @{
                                  @"Accept" : @"application/json",
                                  @"Referer" : @"from ISO app"
                                  };
    }
    return _defaulRequestHeaders;
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
        self._manager.requestSerializer = requestSerializer;
        for (id key in self.defaulRequestHeaders) {
            [self setRequestHeaderValue:self.defaulRequestHeaders[key] withKey:key];
        }
        
        //设置响应信息
        AFJSONResponseSerializer * responseSerializer = [[AFJSONResponseSerializer alloc] init];
        [responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil]];
        
        self._manager.responseSerializer = responseSerializer;
        
        self._manager.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}


/**
 *  设置请求的头部信息
 *
 *  @param value 头部信息的值
 *  @param key   头部信息的键
 */
- (void)setRequestHeaderValue:(id)value withKey:(NSString*)key
{
    [self._manager.requestSerializer setValue:value forHTTPHeaderField:key];
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
                       andBlock:(ScuessBlock)block
{
    if (!apiPath || apiPath.length <= 0) {
        return;
    }
    
    apiPath = [apiPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // 设置状态栏网络请求的提示,错误处理
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [MBProgressHUD showHUDAddedTo:kMainWindow animated:YES];
    ScuessBlock _tempBlock = ^(id data, NSError * error)
    {
        block(data, error);
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [MBProgressHUD hideHUDForView:kMainWindow animated:NO];
//        if (isShowError && error) {
//            [NSObject ShowErrorInfomation:error];
//        }
    };
    
    switch (method)
    {
        case GBHSRequestMethodGET:
        {
            // 对所有GET请求做缓存,这样可以达到离线阅读的效果.
            // [TODO:]暂时用普通的文件进行存放,后续可以添加加密,更复杂的缓存规则,缓存过期等处理
            NSString * cachePath = [apiPath stringByAppendingString:[parameters description]];
            [self._manager GET:apiPath
                    parameters:parameters
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           NSError * error = [NSObject parseResponseWithResponseObject:responseObject isShowError:isShowError];
                           
                           if (error) {
                               _tempBlock([[CacheManager shareManager] getCacheObjectForKey:cachePath], error);
                           }else{
                               [[CacheManager shareManager] setCacheObject:responseObject forKey:cachePath];
                               _tempBlock(responseObject, nil);
                           }
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           _tempBlock([[CacheManager shareManager] getCacheObjectForKey:cachePath], nil);
                       }];
            break;
        }
            
        case GBHSRequestMethodPOST:
        {
            [self._manager POST:apiPath
                    parameters:parameters
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           _tempBlock(responseObject, [NSObject parseResponseWithResponseObject:responseObject isShowError:isShowError]);
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           _tempBlock(nil, error);
                       }];
            break;
        }
            
        case GBHSRequestMethodPUT:
        {
            [self._manager PUT:apiPath
                    parameters:parameters
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           _tempBlock(responseObject, [NSObject parseResponseWithResponseObject:responseObject isShowError:isShowError]);
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           _tempBlock(nil, error);
                       }];
            break;
        }
            
        case GBHSRequestMethodDELETE:
        {
            [self._manager DELETE:apiPath
                    parameters:parameters
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           _tempBlock(responseObject, [NSObject parseResponseWithResponseObject:responseObject isShowError:isShowError]);
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           _tempBlock(nil, error);
                       }];
            break;
        }
    }
}




@end
