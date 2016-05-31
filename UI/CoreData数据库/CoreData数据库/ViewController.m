//
//  ViewController.m
//  CoreData数据库
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
    NSManagedObjectContext * _context;//coreData管理数据的上下文，实际创建管理数据库的环境
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    //打开数据库，创建上下文
    [self openDB];
    
    //增加一个学生对象
//    [self insertModel];
//
//    //查找
//    [self selectAll];
    
    //修改
    [self updataModel];
    
    //删除数据
//    [self deleteModel];
	
}
-(void)deleteModel
{
    NSFetchRequest * req = [[NSFetchRequest alloc] initWithEntityName:@"StudentEntity"];
    NSArray * arr = [_context executeFetchRequest:req error:nil];
   
    [_context deleteObject:arr[1]];
    [_context save:nil];
}
-(void)updataModel
{
    NSFetchRequest * req = [[NSFetchRequest alloc] initWithEntityName:@"StudentEntity"];
    NSArray * arr = [_context executeFetchRequest:req error:nil];
    [arr[0] setSName:@"hanmeimei"];
    [_context save:nil];
    
}
-(void)selectAll
{
    NSFetchRequest * req = [[NSFetchRequest alloc] initWithEntityName:@"ClassEntity"];
    //正则表达式
//    req.predicate = [NSPredicate predicateWithFormat:@"sname CONTAINS 'mei' "];
    
    NSArray * arr = [_context executeFetchRequest:req error:nil];
    
    for (ClassEntity * c in arr) {
        NSLog(@"name = %@",c.name);
        NSSet * students = c.students;
        for (StudentEntity * s in students) {
            NSLog(@"%@",s.sName);
        }
        
    }
    
//    for (StudentEntity * stu in arr) {
//        NSLog(@"name = %@",stu.sName);
//    }
    
    
}

-(void)insertModel
{
    StudentEntity * stu = [NSEntityDescription insertNewObjectForEntityForName:@"StudentEntity" inManagedObjectContext:_context];
    stu.sid = @10;
    stu.sName = @"tom";
    
    StudentEntity * stu2 = [NSEntityDescription insertNewObjectForEntityForName:@"StudentEntity" inManagedObjectContext:_context];
    stu2.sid = @12;
    stu2.sName = @"cat";
    
    ClassEntity * c = [NSEntityDescription insertNewObjectForEntityForName:@"ClassEntity" inManagedObjectContext:_context];
    c.classId = @14;
    c.name = @"Android1409";
    
    [c addStudentsObject:stu];
    [c addStudentsObject:stu2];
    
    
    
    //同步到数据库文件
    NSError * error = nil;
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
    //将CoreData里面的所有模型类进行合并
    NSManagedObjectModel * model = [NSManagedObjectModel mergedModelFromBundles:nil];
    //coodinator协议者，用来协议上下文和持久化存储文件，桥梁
    NSPersistentStoreCoordinator * _coodinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSString * path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"student.db"];
    NSError * error = nil;
    //持久化存储实际的存储文件
    //如果这个数据库文件不存在，会自动创建一个文件
    [_coodinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:path] options:nil error:&error];
    if (error) {
        NSLog(@"配置环境失败");
    }
    else
    {
        //创建上下文  上下文(就是一块内存空间)              没有alloc是因为@class
        _context = [[NSManagedObjectContext alloc] init];//需加头文件 <CoreData/CoreData.h>
        _context.persistentStoreCoordinator = _coodinator;
    }
}


@end
