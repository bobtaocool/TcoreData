//
//  Person+CoreDataProperties.m
//  TcoreData
//
//  Created by bob on 16/9/5.
//  Copyright © 2016年 bob. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person+CoreDataProperties.h"
#import "AppDelegate.h"
@implementation Person (CoreDataProperties)

@dynamic name;
@dynamic age;
@dynamic sex;
@dynamic updatedate;


//插入数据
+(BOOL)insertPersonname:(NSString*)name andage:(NSInteger)age andupdate:(NSDate*)update andsex:(NSString*)sex
{
    
    Person *Insertperson=[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:kCoreDataContext];
    
    Insertperson.name=name;
    
    Insertperson.age=[NSNumber numberWithInteger:age];
    
    Insertperson.updatedate=update;
    
    Insertperson.sex=sex;
    
    //保存, 将插入操作更新到数据库
    NSError *error;
    [kCoreDataContext save:&error];
    
    if (error == nil) {
        return YES;
    }
    return NO;
    
    
}


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

+(NSArray*)selectWithType:(NSInteger)Searchtype andpageSize:(NSInteger)pageSize andAge:(NSInteger)age  andSex:(NSInteger)Sex andascending:(BOOL)ascending
{
    
    //创建查询请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    //根据参数进行升序降序排列
    switch (Searchtype) {
        case 1:
        {
            //按更新时间排列
            
            NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"updatedate" ascending:ascending];
            
            NSArray *sortDescriptors=[NSArray arrayWithObject:sort];
            
            [request setSortDescriptors:sortDescriptors];
      
        }

            break;
            case 2:
            
        {
            //按年龄排列
            NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"age" ascending:ascending];
            
            NSArray *sortDescriptors=[NSArray arrayWithObject:sort];
            
            [request setSortDescriptors:sortDescriptors];
     
        }
  
            break;
            
            
        default:
            break;
    }
    
    if (pageSize!=0) {
        
        [request setFetchLimit:pageSize];//设定查询个数
        
    }
    
//    [request setFetchOffset:0];//从第几个开始查询
    
    
    NSString *sexStr;
    
    if (Sex==1) {
        
        sexStr=@"男";
    }else{
        
        
        sexStr=@"女";
    }
    
    //根据年龄和性别
    if (age==1) {
        
         request.predicate=[NSPredicate predicateWithFormat:@"sex=%@",sexStr];
        
    }else{
        
        
        request.predicate=[NSPredicate predicateWithFormat:@"sex=%@ AND age<=%d",sexStr,20];
    }

    NSError *error;
    NSArray *arr = [kCoreDataContext executeFetchRequest:request error:&error];
    
    if (error == nil) {
        return arr;
    }
    return nil;

}



//查询所有人
+(NSArray *)searchPerson
{
    
    //创建查询请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    
    NSError *error;
    NSArray *arr = [kCoreDataContext executeFetchRequest:request error:&error];
    
    if (error == nil) {
        return arr;
    }
    return nil;

}



//更新数据
+(void)updatePeson:(Person*)peson andkey:(NSString*)key anddata:(NSString*)data
{
    //先查出数据, 然后再更新
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    //添加查询条件
    request.predicate=[NSPredicate predicateWithFormat:@"name=%@",peson.name];
    
    //执行查询
    NSArray *arr = [kCoreDataContext executeFetchRequest:request error:nil];
    
    
    if ([key isEqualToString:@"name"]) {
        
        
        for (Person *p in arr) {
    
            p.name = data;
            
        }
        
        
    }else if ([key isEqualToString:@"age"])
    {
        
        for (Person *p in arr) {
    
              p.age=@([data integerValue]);
            
        }
        

    }else{
        
        for (Person *p in arr) {
   
            p.sex=data;
            
        }
        
        
    }

    [kCoreDataContext save:nil];

}


//删除数据
+ (void)deleteWithPerson:(Person *)person
{
    //删除数据
    [kCoreDataContext deleteObject:person];
    
    //保存, 将删除操作更新到数据库中
    [kCoreDataContext save:nil];

}



//删除所有数据

+(void)deleteAllDatas
{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    NSArray *arr = [kCoreDataContext executeFetchRequest:request error:nil];
    
    for (Person*p in arr) {
        
        //删除数据
        [kCoreDataContext deleteObject:p];
 
    }
    
    //保存, 将删除操作更新到数据库中
    [kCoreDataContext save:nil];

}


@end
