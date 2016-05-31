//
//  QFURLConnection.m
//  HttpDemo
//
//  Created by qianfeng on 14-10-11.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//
#include <unistd.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>

#import "QFURLConnection.h"

@implementation QFURLConnection
-(id)initWithUrl:(NSURL *)url delegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.url = url;
        _thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadMain:) object:nil];
        [_thread start];
        
    }
    return self;
}
-(void)threadMain:(id)arg
{
    //做网络连接
    //要像服务器 192.168.88.8/sns/my/user_list.php?page=2
    //
    /*
     GET /sns/my/user_list.php?page=2 HTTP/1.1\r\n
     Host: 192.168.88.8\r\n
     \r\n
    */
    // 1.AF_INET创建一个套接字  SOCK_STREAM TCP SOCK_DGRAM UDP
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    // 2.连接服务器
    short port = self.url.port.intValue;
    if (port==0) {
        port=80;
    }
    struct sockaddr_in serverAddr;
    memset(&serverAddr, 0, sizeof(serverAddr));
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(port);
    serverAddr.sin_addr.s_addr =  inet_addr("192.168.88.8");
    
    int ret = connect(sock, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
    if (ret<0) {
        perror("connect error");
        goto err;
    }
    //3 发送HTTP GET协议
    
    char * p ="GET /sns/my/user_list.php?page=2 HTTP\1.1\r\n";
    write(sock, p, strlen(p));
    char * p2 = "Host:192.168.88.8\r\n";
    write(sock, p2, strlen(p2));
    char * p3 = "\r\n";
    write(sock, p3, strlen(p3));
    
    char responseBuf[1024];
    int index = 0;
    int ch;
    while (1) {
        
        
    }
    ret = read(sock, responseBuf, 1024);
    NSLog(@"buf is %s",responseBuf);
//    响应分为2个 响应头+响应体
//    响应头一定是字符串
//    响应是可以任意类型的数据
err:
    close(sock);
}
@end
