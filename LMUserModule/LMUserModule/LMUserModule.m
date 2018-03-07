//
//  LMUserModule.m
//  LMUserModule
//
//  Created by KADFWJ on 2018/3/7.
//  Copyright © 2018年 KAD. All rights reserved.
//

#import "LMUserModule.h"
#import <BeeHive/BeeHive.h>
#import <LMUserServeice/LMUserServiceProtocol.h>
#import "LMUserViewController.h"

@interface LMUserModule()<BHModuleProtocol>

@end

@implementation LMUserModule

BH_EXPORT_MODULE()

- (void)modSetUp:(BHContext *)context
{
    
    [[BeeHive shareInstance] registerService:@protocol(LMUserServiceProtocol) service: [LMUserViewController class]];
    
}

-(void)modDidCustomEvent:(BHContext *)context{
    
    if (context.customEvent == 10002) {
        
        NSLog(@"%@",context.userActivityItem.userActivity.userInfo);
        
        //用户模块那到数据后，自己添加处理逻辑，和模块内部的数据传输
        //使用通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserNotification" object:context.userActivityItem.userActivity.userInfo];
    }
}

@end
