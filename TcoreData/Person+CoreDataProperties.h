//
//  Person+CoreDataProperties.h
//  TcoreData
//
//  Created by bob on 16/9/5.
//  Copyright © 2016年 bob. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"
#import "perInforModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *sex;
@property (nullable, nonatomic, retain) NSDate *updatedate;



//插入数据
+(BOOL)insertPersonname:(NSString*)name andage:(NSInteger)age andupdate:(NSDate*)update andsex:(NSString*)sex;


/**
 *  //条件查询
 *
 *  @param Searchtype 1.为按更新时间   2.按年龄   
 *  @param pageSize   2.查询个数
 *  @param age        3.年龄要求
 *  @param Sex        4.性别要求
 *  @param ascending  5.是否升序
 *  @return
 */

+(NSArray*)selectWithType:(NSInteger)Searchtype andpageSize:(NSInteger)pageSize andAge:(NSInteger)age  andSex:(NSInteger)Sex andascending:(BOOL)ascending;


//查询所以人
+(NSArray *)searchPerson;

//更新数据
+(void)updatePeson:(Person*)peson andkey:(NSString*)key anddata:(NSString*)data;


//删除数据
+ (void)deleteWithPerson:(Person *)person;



//删除所有数据

+(void)deleteAllDatas;


@end

NS_ASSUME_NONNULL_END
