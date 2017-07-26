//
//  SYCodingModel.h
//  SYNSCodingDemo
//
//  Created by 666gps on 2017/7/26.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYCodingModel : NSObject<NSCoding>
@property (nonatomic,copy) NSString * name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,copy) NSString * sex;
@end


@interface SYCodingClassModel : NSObject<NSCoding>
@property (nonatomic,assign) NSInteger classNumber;
@property (nonatomic,copy) NSString * className;
@property (nonatomic,assign) BOOL isFirst;
@property (nonatomic,copy) NSArray<SYCodingModel *> * students;
@end
