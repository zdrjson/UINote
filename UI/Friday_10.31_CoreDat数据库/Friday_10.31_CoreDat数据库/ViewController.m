//
//  ViewController.m
//  Friday_10.31_CoreDat数据库
//
//  Created by qianfeng on 14-10-31.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "StudentEntity.h"
#import "ClassEntity.h"
@interface ViewController ()
{
    NSManagedObjectContext * _context; //coreData管理数据库的上下文，实际创建管理数据库的环境
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSHomeDirectory());
    //打开数据库，创建上下文
    [self openDB];
    
    //增加一个学生对象
//    [self insertModel];
    
    //查找
//    [self selectAll];
    //修改
//    [self updateModel];
    
    //删除数据
    [self deleteModel];
    
}
-(void)deleteModel
{
    NSFetchRequest * req = [[NSFetchRequest alloc] initWithEntityName:@"StudentEntity"];
    NSArray * arr = [_context executeFetchRequest:req error:nil];
    [_context deleteObject:arr[1]];
    [_context save:nil];
}
-(void)updateModel
{
    NSFetchRequest * req = [[NSFetchRequest alloc] initWithEntityName:@"StudentEntity"];
    NSArray * arr = [_context executeFetchRequest:req error:nil];
    [arr[0] setSName:@"hanmeimei"];
    [_context save:nil];
}
-(void)selectAll
{
    NSFetchRequest * req = [[NSFetchRequest alloc] initWithEntityName:@"StudentEntity"];
    //正则表达式
    req.predicate = [NSPredicate predicateWithFormat:@"sName CONTAINS 'mei' "];
    NSArray * arr = [_context executeFetchRequest:req error:nil];
    for (StudentEntity * stu in arr) {
        NSLog(@"%@",stu.sName);
    }
    
}
-(void)insertModel
{
    StudentEntity * stu = [NSEntityDescription insertNewObjectForEntityForName:@"StudentEntity" inManagedObjectContext:_context];
    stu.sId = @10;
    stu.sName = @"lilei";
    
    NSError * error = nil;
    //同步到数据库文件
    [_context save:&error];
    if (error) {
        NSLog(@"增加数据失败");
    }
    else
    {
        NSLog(@"增加数据成功");
    }
}
-(void)openDB
{
    //将CoreData里面的所有数据模型进行合并
    NSManagedObjectModel * model = [NSManagedObjectModel mergedModelFromBundles:nil];
    //coordinator 协议者，用来协议上下文和持久化存储文件，桥梁
    NSPersistentStoreCoordinator * _coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSString * path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"student.db"];
    NSError * error = nil;
    //持久化存储实际的存储文件
    //如果这个数据库不存在，会自动创建一个文件
    [_coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:path] options:nil error:&error];
    if (error) {
        NSLog(@"配置环境失败");
    }
    else
    {
        //创建上下文 上下文就是一块内存空间
        _context = [[NSManagedObjectContext alloc] init];
        _context.persistentStoreCoordinator = _coordinator;
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
