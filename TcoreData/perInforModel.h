//
//  perInforModel.h
//  TcoreData
//
//  Created by bob on 16/9/5.
//  Copyright © 2016年 bob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface perInforModel : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,strong)NSDate *update;

@property(nonatomic,assign)int age;

@property(nonatomic,copy)NSString*sex;

-(instancetype)initWithname:(NSString*)name andupdate:(NSDate*)update andage:(int)age andsex:(NSString*)sex;

@end
