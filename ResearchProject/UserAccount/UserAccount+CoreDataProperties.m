//
//  UserAccount+CoreDataProperties.m
//  
//
//  Created by Apple on 2017/4/3.
//
//  This file was automatically generated and should not be edited.
//

#import "UserAccount+CoreDataProperties.h"

@implementation UserAccount (CoreDataProperties)

+ (NSFetchRequest<UserAccount *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserAccount"];
}

@dynamic uid;
@dynamic update_time;
@dynamic email;
@dynamic password;

@end
