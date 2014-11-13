//
//  KVCPerson.h
//  KVCLab
//
//  Created by Tong G. on 11/7/14.
//
//

#import <Foundation/Foundation.h>

@interface KVCPerson : NSObject <NSCopying>
    {
@private
    NSString* _firstName;
    NSString* _lastName;

    unsigned short _age;
    }

@property ( nonatomic, copy ) NSString* firstName;
@property ( nonatomic, copy ) NSString* lastName;
@property ( nonatomic, assign ) unsigned short age;

+ ( instancetype ) personWithFirstName: ( NSString* )_FirstName
                              lastName: ( NSString* )_LastName
                                   age: ( unsigned short )_Age;

@end
