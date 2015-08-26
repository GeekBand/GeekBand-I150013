//
//  GBHSResponseBaseModel.h
//  HousewareShare_IOS
//
//  Created by as4 on 15/8/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>

@interface GBHSResponseBaseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString * responseCode;
@property (nonatomic, strong) NSString * responseMsg;


@end
