//
//  ViewController.m
//  Thursday_10.23_多线程
//
//  Created by qianfeng on 14-10-23.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImage * _image;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
}
-(void)click
{
    NSLog(@"开始运行-->%@",[NSDate date]);
//    [self sync];
//    异步
//    [self systemThread];
//    [self thread];
//    [self operation];
    [self gcd];
}
//同步
-(void)sync
{
    [self task1];
    [self task2];
    [self task3];
}
//异步
//多线程
//1：系统自带的
-(void)systemThread
{
    [self performSelectorInBackground:@selector(task1) withObject:nil];
    [self performSelectorInBackground:@selector(task2) withObject:nil];
    [self performSelectorInBackground:@selector(task3) withObject:nil];
    
}
//2:NSTread:比较耗资源
-(void)thread
{
    //类方法直接创建子线程
    [NSThread detachNewThreadSelector:@selector(task3) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(task2) toTarget:self withObject:nil];
    
    //对象方法
    NSThread * th = [[NSThread alloc] initWithTarget:self selector:@selector(task1) object:nil];
    //手动启动
    [th start];
}
//NSOperation
-(void)operation
{
    /*
     默认情况下，NSOperation并不具备封装操作的能力，必须使用它的子类，使用NSOperation子类的方式有3种：
     1> 自定义子类继承NSOperation，实现内部相应的方法
     
     2> NSBlockOperation
     
     3>NSInvocationOperation
     
     */
    NSInvocationOperation * task1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
    NSInvocationOperation * task2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task2) object:nil];
    NSInvocationOperation * task3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task3) object:nil];
    //任务队列
    NSOperationQueue * queue  = [[NSOperationQueue alloc] init];
    [queue addOperation:task1];
    [queue addOperation:task2];
    [queue addOperation:task3];
    
    [queue addOperationWithBlock:^{
        sleep(5);
        NSLog(@"task4-->%@",[NSDate date]);
    }];
    
}
-(void)gcd
{
//    [self GCDBase];
//    [self gcdGroup];
//    [self barrier];
    [self time];
}
//GCD是基于语言的，效率高
-(void)GCDBase
{
    //创建线程队列
    //DISPATCH_QUEUE_CONCURRENT 异步队列
    //DISPATCH_QUEUE_SERIAL 同步队列
    //同步运行所有情况是:队列是同步的队列，或者任务是同步加入到队列中的
//    dispatch_queue_t qt = dispatch_queue_create("com.1000phone.gcd", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(qt, ^{
//        [self task1];
//    });
//    dispatch_async(qt, ^{
//        [self task2];
//    });
//    dispatch_async(qt, ^{
//        [self task3];
//    });
//    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self task1];
//    });
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self task2];
//    });
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self task3];
//    });
    //标准用法
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://image16-c.poco.cn/mypoco/myphoto/20140605/18/17457026820140605181136033_640.jpg?570x300_120"]];
       _image = [UIImage imageWithData:data];
//        NSLog(@"%@",NSStringFromCGSize(image.size));
        dispatch_async(dispatch_get_main_queue(), ^{
           //任务完成后，回到主线程队列，进行刷新UI
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
            imageView.image = _image;
            [self.view addSubview:imageView];
            NSLog(@"%@",NSStringFromCGRect(imageView.frame));
        });
    });
    
}
-(void)gcdGroup
{
    //创建线程组
    dispatch_group_t gt = dispatch_group_create();
    
    //创建一个线程队列
    dispatch_queue_t qt = dispatch_queue_create("com", DISPATCH_QUEUE_CONCURRENT);
    //将任务放到线程队列中执行，同时放到线程组中管理
    dispatch_group_async(gt, qt, ^{
        [self task1];
    });
    dispatch_group_async(gt, qt, ^{
        [self task2];
    });
    dispatch_async(qt, ^{
        sleep(5);
        NSLog(@"taskAdd-->%@",[NSDate date]);
    });
    dispatch_group_async(gt, qt, ^{
        [self task3];
    });
    //监测gt线程组中的任务，完成以后，执行这个任务，并将此任务放到qt线程队列中
    dispatch_group_notify(gt, qt, ^{
        NSLog(@"所有任务执行完成");
        NSLog(@"task-->%@",[NSDate date]);
    });
}
//分组运行
-(void)barrier
{
    //条件是必须创建 DISPATCH_QUEUE_CONCURRENT类型的线程队列
    dispatch_queue_t qt = dispatch_queue_create("com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(qt, ^{
        [self task1];
    });
    dispatch_async(qt, ^{
        [self task2];
    });
//    在所有任务中间中断，执行其他任务（下面的任务以这个中断的任务执行完后为时间点，开始执行）
    dispatch_async(qt, ^{
        [self task3];
    });
    dispatch_barrier_async(qt, ^{
        NSLog(@"中断-->%@",[NSDate date]);
    });
    dispatch_async(qt, ^{
        [self task1];
    });
 
}
-(void)time
{  //ull unsigned long long
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 5ull * NSEC_PER_SEC);
    //创建一个线程，让其在固定时间后执行
    dispatch_after(time, dispatch_get_main_queue(), ^{
        self.view.backgroundColor = [UIColor cyanColor];
    });
}
-(void)task1
{
    sleep(2);
    NSLog(@"task1-->%@",[NSDate date]);
}
-(void)task2
{
    sleep(3);
    NSLog(@"task2-->%@",[NSDate date]);
}
-(void)task3
{
    sleep(4);
    NSLog(@"task3-->%@",[NSDate date]);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
