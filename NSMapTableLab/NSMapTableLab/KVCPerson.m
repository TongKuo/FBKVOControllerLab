//
//  KVCPerson.m
//  KVCLab
//
//  Created by Tong G. on 11/7/14.
//
//

#import "KVCPerson.h"

@implementation KVCPerson

@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize age = _age;

- ( NSString* ) description
    {
    return [ @{ @"First Name" : self.firstName
              , @"Last Name" : self.lastName
              , @"Age" : [ NSNumber numberWithUnsignedShort: self.age ]
              } description ];
    }

- ( id ) copyWithZone: ( NSZone* )_Zone
    {
    KVCPerson* newPerson = [ KVCPerson personWithFirstName: self.firstName
                                                  lastName: self.lastName
                                                       age: self.age ];
    return newPerson;
    }

#pragma mark Initializers & Deallocator
+ ( instancetype ) personWithFirstName: ( NSString* )_FirstName
                              lastName: ( NSString* )_LastName
                                   age: ( unsigned short )_Age
    {
    return [ [ [ self alloc ] initWithFirstName: _FirstName
                                       lastName: _LastName
                                            age: _Age ] autorelease ];
    }

- ( instancetype ) initWithFirstName: ( NSString* )_FirstName
                            lastName: ( NSString* )_LastName
                                 age: ( unsigned short )_Age
    {
    if ( self = [ super init ] )
        {
        _firstName = [ _FirstName copy ];
        _lastName = [ _LastName copy ];

        _age = _Age;
        }

    return self;
    }

- ( void ) dealloc
    {
    [ self->_firstName release ];   self->_firstName = nil;
    [ self->_lastName release ];    self->_lastName = nil;

    [ super dealloc ];
    }


- ( void ) setNilValueForKey: ( NSString* )_Key
    {
    if ( [ _Key isEqualToString: @"age" ] )
        [ self setValue: @0 forKey: _Key ];
    else
        [ super setNilValueForKey: _Key ];
    }

@end
