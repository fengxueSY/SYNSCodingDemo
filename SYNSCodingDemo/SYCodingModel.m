//
//  SYCodingModel.m
//  SYNSCodingDemo
//
//  Created by 666gps on 2017/7/26.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import "SYCodingModel.h"

@implementation SYCodingModel

/**
 保存数据时调用

 在该方法中声明哪些属性需要保存
 */
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
}

/**
 解析数据时调用

 该方法中会获取需要读取的数据
 */
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
    }
    return self;
}
@end

@implementation SYCodingClassModel


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.className forKey:@"className"];
    [aCoder encodeBool:self.isFirst forKey:@"isFirst"];
    [aCoder encodeInteger:self.classNumber forKey:@"classNumber"];
    [aCoder encodeObject:self.students forKey:@"students"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super init]) {
        self.className = [aDecoder decodeObjectForKey:@"className"];
        self.classNumber = [aDecoder decodeIntegerForKey:@"classNumber"];
        self.isFirst = [aDecoder decodeBoolForKey:@"isFirst"];
        self.students = [aDecoder decodeObjectForKey:@"students"];
    }
    return self;
}
@end
