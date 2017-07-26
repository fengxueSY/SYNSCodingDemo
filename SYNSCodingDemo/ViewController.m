//
//  ViewController.m
//  SYNSCodingDemo
//
//  Created by 666gps on 2017/7/26.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import "ViewController.h"
#import "SYCodingModel.h"

@interface ViewController ()
{
    NSArray * nameArray;
    NSArray * sexArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    nameArray = @[@"吕布",@"刘备",@"关于",@"张飞",@"赵云",@"夏侯惇",@"姜维",@"曹操"];
    sexArray = @[@"男",@"女",@"未知"];
}
//归档数据
- (IBAction)CodingDataButton:(id)sender {
//储存单个数据
    SYCodingModel * model = [[SYCodingModel alloc]init];
    model.name = @"蔡文姬";
    model.sex = @"女";
    model.age = 20;
    
    //获取沙盒路径
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    //获取文件全路径
    NSString * pathName = [path stringByAppendingString:@"/Coding.data"];
    //归档数据
    [NSKeyedArchiver archiveRootObject:model toFile:pathName];
   
    NSLog(@"文件路径。 %@",path);
    
    
//储存多个数据
    NSMutableArray * array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 100; i++) {
        SYCodingModel * model1 = [[SYCodingModel alloc]init];
        model1.name = nameArray[arc4random()%nameArray.count];
        model1.sex = sexArray[arc4random()%sexArray.count];
        model1.age = arc4random()%80;
        [array addObject:model1];
    }
    
    NSString * paths = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString * pathNames = [paths stringByAppendingString:@"/CodingArray.plist"];
    [NSKeyedArchiver archiveRootObject:array toFile:pathNames];
    
//储存单个嵌套数据
    SYCodingClassModel * classModel = [[SYCodingClassModel alloc]init];
    classModel.className = @"三年级二班";
    classModel.classNumber = 86;
    classModel.isFirst = YES;
    NSMutableArray * st = [[NSMutableArray alloc]init];
    for (int i = 0; i < 86; i++) {
        SYCodingModel * codingModel = [[SYCodingModel alloc]init];
        codingModel.name = nameArray[arc4random()%nameArray.count];
        codingModel.sex = sexArray[arc4random()%sexArray.count];
        codingModel.age = arc4random()%20;
        [st addObject:codingModel];
    }
    classModel.students = st;
    NSString * classPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString * classPathName = [classPath stringByAppendingString:@"/ClassData.data"];
    [NSKeyedArchiver archiveRootObject:classModel toFile:classPathName];
}
//解析数据
- (IBAction)UnCodingDataButton:(id)sender {
    //获取沙河路径
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    //获取文件路径
    NSString * pathName = [path stringByAppendingString:@"/Coding.data"];
    NSString * pathNames = [path stringByAppendingString:@"/CodingArray.plist"];
    NSString * classPath = [path stringByAppendingString:@"/ClassData.data"];
//解析文件
    //单个数据
    SYCodingModel * model = [NSKeyedUnarchiver unarchiveObjectWithFile:pathName];
    NSLog(@"拿到的数据。 %@。%@。%ld",model.name,model.sex,model.age);
    
    //数组数据
    NSArray * listArray = [NSKeyedUnarchiver unarchiveObjectWithFile:pathNames];
    for (SYCodingModel * model in listArray) {
        NSLog(@"拿到的数据。 %@。%@。%ld",model.name,model.sex,model.age);
    }
    
    //单个嵌套数据
    SYCodingClassModel * classModel = [NSKeyedUnarchiver unarchiveObjectWithFile:classPath];
    NSLog(@"---- %@ %ld %u %ld",classModel.className,classModel.classNumber,classModel.isFirst,classModel.students.count);
    for (SYCodingModel * modelS in classModel.students) {
        NSLog(@"拿到的数据。===== %@。%@。%ld",modelS.name,modelS.sex,modelS.age);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
