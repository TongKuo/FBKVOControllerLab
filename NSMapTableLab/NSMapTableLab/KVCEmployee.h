//
//  KVCEmployee.h
//  KVCLab
//
//  Created by Tong G. on 11/7/14.
//
//

#import <Foundation/Foundation.h>

@class KVCPerson;

@interface KVCEmployee : NSObject
    {
@private
    KVCPerson* _person;

    NSDate* _hireDate;
    NSDate* _fireDate;
    }

@property ( nonatomic, retain ) KVCPerson* person;

@property ( nonatomic, retain ) NSDate* hireDate;
@property ( nonatomic, retain ) NSDate* fireDate;

+ ( instancetype ) employeeWithPerson: ( KVCPerson* )_Person
                             hireDate: ( NSDate* )_HireDate;

+ ( instancetype ) employeeWithFirstName: ( NSString* )_FirstName
                                lastName: ( NSString* )_LastName
                                     age: ( unsigned short )_Age
                                hireDate: ( NSDate* )_HireDate;

@end
