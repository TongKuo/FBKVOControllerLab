//
//  KVCEmployee.m
//  KVCLab
//
//  Created by Tong G. on 11/7/14.
//
//

#import "KVCEmployee.h"
#import "KVCPerson.h"

@implementation KVCEmployee

@synthesize person = _person;

@synthesize hireDate = _hireDate;
@synthesize fireDate = _fireDate;

- ( NSString* ) description
    {
    return [ @{ @"First Name" : self.person.firstName ? self.person.firstName : @"N/A"
              , @"Last Name" : self.person.lastName ? self.person.lastName : @"N/A"
              , @"Age" : [ NSNumber numberWithUnsignedShort: self.person.age ]
              , @"Hire Date" : self.hireDate ? self.hireDate : @"N/A"
              , @"Fire Date" : self.fireDate ? self.fireDate : @"N/A"
              } description ];
    }

- ( id ) copyWithZone: ( NSZone* )_Zone
    {
    KVCEmployee* newEmployee = [ KVCEmployee employeeWithPerson: [ self.person copy ]
                                                       hireDate: self.hireDate ];

    if ( self.fireDate )
        newEmployee.fireDate = self.fireDate;

    return newEmployee;
    }

#pragma mark Initializers & Deallocator
+ ( instancetype ) employeeWithPerson: ( KVCPerson* )_Person
                             hireDate: ( NSDate* )_HireDate
    {
    return [ [ [ self alloc ] initWithPerson: _Person
                                    hireDate: _HireDate ] autorelease ];
    }

+ ( instancetype ) employeeWithFirstName: ( NSString* )_FirstName
                                lastName: ( NSString* )_LastName
                                     age: ( unsigned short )_Age
                                hireDate: ( NSDate* )_HireDate
    {
    return [ [ [ self alloc ] initWithFirstName: _FirstName
                                       lastName: _LastName
                                            age: _Age
                                       hireDate: _HireDate ] autorelease ];
    }

- ( instancetype ) initWithPerson: ( KVCPerson* )_Person
                         hireDate: ( NSDate* )_HireDate
    {
    if ( self = [ super init ] )
        {
        _person = [ _Person retain ];

        _hireDate = [ _HireDate retain ];
        }

    return self;
    }

- ( instancetype ) initWithFirstName: ( NSString* )_FirstName
                            lastName: ( NSString* )_LastName
                                 age: ( unsigned short )_Age
                            hireDate: ( NSDate* )_HireDate
    {
    KVCPerson* newPerson = [ KVCPerson personWithFirstName: _FirstName
                                                  lastName: _LastName
                                                       age: _Age ];
    return [ self initWithPerson: newPerson
                        hireDate: _HireDate ];
    }

- ( void ) dealloc
    {
    [ self->_person release ];   self->_person = nil;

    [ self->_hireDate release ];    self->_hireDate = nil;
    [ self->_fireDate release ];    self->_fireDate = nil;

    [ super dealloc ];
    }

- ( id ) valueForUndefinedKey: ( NSString* )_Key
    {
    return [ super valueForUndefinedKey: _Key ];
    }

- ( void ) setValue: ( id )_Value
    forUndefinedKey: ( NSString* )_Key
    {
    [ super setValue: _Value forUndefinedKey: _Key ];
    }

- ( void ) setNilValueForKey: ( NSString* )_Key
    {
    [ super setNilValueForKey: _Key ];
    }

@end
