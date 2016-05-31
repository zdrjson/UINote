//
//  QFXmppManager.m
//  Sunday_11.2_ChatDemo
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "QFXmppManager.h"

@implementation QFXmppManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentUser = [[UserModel alloc] init];
        _allFriendList = [[NSMutableArray alloc] init];
        _xmppStream = [[XMPPStream alloc] init];
        [_xmppStream setHostName:@"1000phone.net"];
        [_xmppStream setHostPort:5222];
        //在这里并没有连接
        //self
        [_xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    return self;
}
+(id)shareInstance
{
    static id _s = nil;
    if (!_s) {
        _s = [[[self class] alloc] init];
    }
    return _s;
}
-(void)registerUser:(NSString *)jib withPasswordFeild:(NSString *)password withCompletion:(void (^)(BOOL, NSError *))cb
{
    _saveRegcb = cb;
    _isInRegisting = YES;
    //真正的注册
    if ([_xmppStream isConnected]) {
        [_xmppStream disconnect];
    }
    _currentUser.jid = jib;
    _currentUser.password = password;
    //把jid字符串转化成XMPPJID对象
    //类似nsstring --->nsurl
    XMPPJID * myjid = [XMPPJID jidWithString:jib];
    //给这个xmpp流设置一个账号
    [_xmppStream setMyJID:myjid];
    NSError * error = nil;
    BOOL ret = [_xmppStream connectWithTimeout:-1 error:&error];
    //异步注册 需要代理
    if (!ret) {
        if (_saveRegcb) {
            _saveRegcb(NO,error);
        }
    }
}
- (void)xmppStreamDidConnect:(XMPPStream *)sender
{
    NSLog(@"连接上了 %@",NSStringFromSelector(_cmd));
    //输入密码
    //给xmppserver/openfire passpword
    NSError * error = nil;
    if (_isInRegisting) {
        //一旦注册就回到xmppStreamDidRegister
        [_xmppStream registerWithPassword:_currentUser.password error:&error];
    }
    else
    {
        //如果对于已经有的用户，这是授权密码
        [_xmppStream authenticateWithPassword:_currentUser.password error:&error];
        //一旦授权完成。。。就会进入密码授权正确
    }
    //成功失败
}
- (void)xmppStreamDidRegister:(XMPPStream *)sender
{
    NSLog(@"function %@",NSStringFromSelector(_cmd));
    if (_saveRegcb) {
        _saveRegcb(YES,nil);
    }
}

/**
 * This method is called if registration fails.
 **/
- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement *)error
{
    NSLog(@"function %@",NSStringFromSelector(_cmd));
    NSLog(@"error is %@",[error description]);
    if (_saveRegcb) {
        NSError * myerror = [NSError errorWithDomain:error.description code:-1 userInfo:nil];
        _saveRegcb(NO,myerror);
    }
}
/*
 <iq xmlns="jabber:client" type="error" to="1000phone.net/7a634e9e">
 <query xmlns="jabber:iq:register">
 <username>zdrzdrzdrzdrzdr</username>
 <password>123456</password>
 </query>
 <error code="409" type="cancel">
 <conflict xmlns="urn:ietf:params:xml:ns:xmpp-stanzas"/>
 </error>
 </iq>
 */
#pragma mark -登录部分
-(void)loginUser:(NSString *)jib withPasswordFeild:(NSString *)password withCompletion:(void (^)(BOOL, NSError *))cb
{
    _saveLoginCb = cb;
    _isInRegisting = NO;
    //登录分为2步
    //    1.给服务器输入账号，2.给服务器输入密码
    _currentUser.jid = jib;
    _currentUser.password = password;
    XMPPJID * myjid = [XMPPJID jidWithString:jib];
    if ([_xmppStream isConnected]) {
        [_xmppStream disconnect];
    }
    [_xmppStream setMyJID:myjid];
    NSError * error = nil;
    //    1.给sever
    BOOL ret = [_xmppStream connectWithTimeout:-1 error:&error];
    if (!ret) {
        _saveLoginCb(NO,error);
    }
}
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
    //授权成功
    //    NSLog(@"function is %@",NSStringFromSelector(_cmd));
    //可以上线...goon line
    if (_saveLoginCb) {
        _saveLoginCb(YES,nil);
    }
    //上线//获取所有好友
    [self goOnline];
    //取得所有好友信息
    //取得当前上线是谁
    [self getAllFriends];
}
//IQ Information Query 信息查询
-(void)getAllFriends
{
    //用来产生一个节点  <query xmlns="jabber:iq:roster"/> 相当于 <query xmlns="jabber:iq:roster"></query>
    NSXMLElement * query = [NSXMLElement elementWithName:@"query" xmlns:@"jabber:iq:roster"];
    //<iq></iq> = <iq/>
    NSXMLElement * iq = [NSXMLElement elementWithName:@"iq"];
    //<iq type="get"></iq> = <iq/>
    [iq addAttributeWithName:@"type" stringValue:@"get"];
    //<iq type="get"><query xmlns="jabber:iq:roster"></query></iq>
    [iq addChild:query];
    //NSXMLElement 就是一个节点...
    /*
     <iq type="get">
     <query xmlns="jabber:iq:roster"/>
     </iq>
     */
    NSLog(@"all friends %@",iq);
    //传给服务器  服务器要返回 XML
    [_xmppStream sendElement:iq];
}
/**
 * This method is called if authentication fails.
 **/
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error
{
    NSLog(@"function is %@",NSStringFromSelector(_cmd));
    if (_saveLoginCb) {
        _saveLoginCb(NO,[NSError errorWithDomain:error.description code:-1 userInfo:nil]);
    }
}
-(void)goOnline
{
    //Presence
    XMPPPresence * p = [XMPPPresence presence];
    NSLog(@"p is %@",p);
    [_xmppStream sendElement:p];
    
}
- (BOOL)xmppStream:(XMPPStream *)sender didReceiveIQ:(XMPPIQ *)iq
{
    //取得第一个节点
    NSXMLElement * query = iq.childElement;
    for (NSXMLElement * oneChild in query.children) {
        NSString * jid = [oneChild  attributeStringValueForName:@"jid"];
        NSLog(@"jid is %@",jid);
//        UserModel * um = [[UserModel alloc] init];
//        um.jid = jid;
//        um.status = @"unavaiable";
//        [_allFriendList addObject:um];
        [self addOrUpdateUser:jid wihtStatus:@"unavaiable" needToChangeStatus:NO];
    }
    //    NSLog(@"func %@ IQ %@",NSStringFromSelector(_cmd),iq);
    /*
     <iq xmlns="jabber:client" type="result" to="zdrzdrzdrzdrzdr@1000phone.net/2fbbe7f1">
     <query xmlns="jabber:iq:roster">
     <item jid="zdr@1000phone.net" subscription="from"/>
     </query>
     </iq>
     */
    return YES;
}
- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message
{
        NSLog(@"func %@ message %@",NSStringFromSelector(_cmd),message);
}
- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence
{
    //把数组中某个人的信息 状态改变
    NSArray * arr = presence.children;
    NSString * jid = [presence attributeStringValueForName:@"from"];
    NSString * status = @"online";
    
    //判断里面show
    for (NSXMLElement * oneChild in presence.children) {
        if ([oneChild.name isEqualToString:@"show"]) {
            status = @"away";
        }
    }
    // zdr@1000phone.net/qianfengdeMac-mini-152
    XMPPJID * hisJid = [XMPPJID jidWithString:jid];
    jid = [NSString stringWithFormat:@"%@@%@",hisJid.user,hisJid.domain];
    NSLog(@"online jid %@",jid);
    [self addOrUpdateUser:jid wihtStatus:status];
//    NSLog(@"func %@ presence %@",NSStringFromSelector(_cmd),presence);
    /*
     <presence xmlns="jabber:client" from="zdrzdrzdrzdrzdr@1000phone.net/8a278735" to="zdrzdrzdrzdrzdr@1000phone.net/8a278735"/>
     Away
     <presence xmlns="jabber:client" from="zdrzdrzdrzdrzdr@1000phone.net/qianfengdeMac-mini-152" to="zdrzdrzdrzdrzdr@1000phone.net/bddbcc4e">
     <show>away</show>
     <status>离开</status>
     <c xmlns="http://jabber.org/protocol/caps" node="http://pidgin.im/" hash="sha-1" ver="1JjQ90oGzlCIYA/GPhGIjXFQcP0="/>
     <x xmlns="vcard-temp:x:update">
     <photo/>
     </x>
     </presence>
     */
    /*
     <message xmlns="jabber:client" type="chat" id="purple5e635215" to="zdrzdrzdrzdrzdr@1000phone.net" from="zdr@1000phone.net/qianfengdeMac-mini-152">
      <composing xmlns="http://jabber.org/protocol/chatstates"/>
     </message>
     
    <message xmlns="jabber:client" type="chat" id="purple5e635227" to="zdrzdrzdrzdrzdr@1000phone.net" from="zdr@1000phone.net/qianfengdeMac-mini-152">
      <active xmlns="http://jabber.org/protocol/chatstates"/>
      <body>hi</body>
    </message>
     */
}
//增加这个人，如果这个人已经存在了，就不要改变状态
-(void)addOrUpdateUser:(NSString *)jid wihtStatus:(NSString *)status needToChangeStatus:(BOOL)yesOrNO
{
    for (UserModel * um in _allFriendList) {
        if ([um.jid isEqualToString:jid]) {
            return;
        }
    }
    [self addOrUpdateUser:jid wihtStatus:status];
}
-(void)addOrUpdateUser:(NSString *)jid wihtStatus:(NSString *)status
{
    for (UserModel * um in _allFriendList) {
        if ([um.jid isEqualToString:jid]) {
            //存在这个
            um.status = status;
            return;
        }
    }
    UserModel * um = [[UserModel alloc] init];
    um.jid = jid;
    um.status = status;
    [_allFriendList addObject:um];
    
}
@end
