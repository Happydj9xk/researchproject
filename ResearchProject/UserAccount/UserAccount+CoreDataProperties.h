//
//  UserAccount+CoreDataProperties.h
//  
//
//  Created by Apple on 2017/4/3.
//
//  This file was automatically generated and should not be edited.
//

#import "UserAccount+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserAccount (CoreDataProperties)

+ (NSFetchRequest<UserAccount *> *)fetchRequest;

@property (nonatomic) int64_t uid;
@property (nonatomic) int64_t update_time;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *password;

@end

NS_ASSUME_NONNULL_END
