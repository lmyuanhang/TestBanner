//
//  NetworkDefine.h
//  TestAFNetworking2_0
//  网络操作的定义
//  Created by ghm on 16/6/24.
//  Copyright © 2016年 ghm. All rights reserved.
//

#ifndef NetworkDefine_h
#define NetworkDefine_h

//0为测试环境
//1为真实环境
#define NETWORK_ENVIRONMENT 0

#if NETWORK_ENVIRONMENT == 0
#define kBaseServerURL @"http://188.188.22.134:8888/chezhibao-api/apiService.hs"
#else
#define kBaseServerURL @"http://api.mychebao.com/chezhibao-api/apiService.hs"
#endif

//登录
#define kLoginService @"channel.user.login"

#endif /* NetworkDefine_h */
