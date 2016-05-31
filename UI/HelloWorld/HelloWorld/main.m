//
//  main.m
//  HelloWorld
//
//  Created by qianfeng on 14-9-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        //第三个参数：默认为UIApplication 类的字符串，如果我们填入nil，这个方法会自动取UIApplication,我们也可以创建自己的类，继承自UIApplication类，在这里填入我们自己创建的类。
        //在这个方法中会自动创建第三个参数的对象（实例），这个对象就代表我们当前的应用程序。每一个应用程序中，只有一个UIApplication类的对象。
        
        //第四个参数：传入应用程序委托类类名，在每一个应用程序当中，会创建一个委托类对象，作为应用程序的对象的委托。由这个类来定制我们的应用程序。
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
