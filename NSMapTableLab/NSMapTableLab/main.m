///:
/*****************************************************************************
 **                                                                         **
 **                               .======.                                  **
 **                               | INRI |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                      .========'      '========.                         **
 **                      |   _      xxxx      _   |                         **
 **                      |  /_;-.__ / _\  _.-;_\  |                         **
 **                      |     `-._`'`_/'`.-'     |                         **
 **                      '========.`\   /`========'                         **
 **                               | |  / |                                  **
 **                               |/-.(  |                                  **
 **                               |\_._\ |                                  **
 **                               | \ \`;|                                  **
 **                               |  > |/|                                  **
 **                               | / // |                                  **
 **                               | |//  |                                  **
 **                               | \(\  |                                  **
 **                               |  ``  |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                   \\    _  _\\| \//  |//_   _ \// _                     **
 **                  ^ `^`^ ^`` `^ ^` ``^^`  `^^` `^ `^                     **
 **                                                                         **
 **                       Copyright (c) 2014 Tong G.                        **
 **                          ALL RIGHTS RESERVED.                           **
 **                                                                         **
 ****************************************************************************/

#import <Cocoa/Cocoa.h>

#import "KVCPerson.h"
#import "KVCEmployee.h"

int main( int _Argc, char const* _Argv[] )
    {
    @autoreleasepool
        {
        KVCEmployee* TongGuo = [ KVCEmployee employeeWithFirstName: @"Tong"
                                                          lastName: @"Guo"
                                                               age: 17
                                                          hireDate: [ NSDate distantPast ] ];
        KVCEmployee* cloneTongGuo = [ TongGuo copy ];

        KVCEmployee* AnQiJiang = [ KVCEmployee employeeWithFirstName: @"AnQi"
                                                            lastName: @"Jiang"
                                                                 age: 17
                                                            hireDate: [ NSDate date ] ];

        NSMapTable* mapTable = [ NSMapTable mapTableWithKeyOptions: NSMapTableStrongMemory
                                                      valueOptions: NSMapTableCopyIn ];

        [ mapTable setObject: TongGuo forKey: @"TongGuo" ];
        [ mapTable setObject: cloneTongGuo forKey: @"CloneTongGuo" ];
        [ mapTable setObject: AnQiJiang forKey: @"AnQiJiang" ];

        for ( KVCEmployee* employeeKey in mapTable )
            NSLog( @"%p", [ mapTable objectForKey: employeeKey ] );

        NSLog( @"%@", mapTable );
        }

    return NSApplicationMain( _Argc, _Argv );
    }

//////////////////////////////////////////////////////////////////////////////

/*****************************************************************************
 **                                                                         **
 **      _________                                      _______             **
 **     |___   ___|                                   / ______ \            **
 **         | |     _______   _______   _______      | /      |_|           **
 **         | |    ||     || ||     || ||     ||     | |    _ __            **
 **         | |    ||     || ||     || ||     ||     | |   |__  \           **
 **         | |    ||     || ||     || ||     ||     | \_ _ __| |  _        **
 **         |_|    ||_____|| ||     || ||_____||      \________/  |_|       **
 **                                           ||                            **
 **                                    ||_____||                            **
 **                                                                         **
 ****************************************************************************/
///:~