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

#import "FBKAppDelegate.h"

#import "NSObject+FBKVOController.h"

@implementation FBKAppDelegate

@synthesize window = _window;

@synthesize slider = _slider;
@synthesize sliderLabel = _sliderLabel;
@synthesize anotherLabel = _anotherLabel;

@synthesize generateRandomColor = _generateRandomColor;
@synthesize colorWell = _colorWell;

@synthesize KVOController = _KVOController;

- ( void ) observedPropertiesChange: ( NSDictionary* )_Change
                            keyPath: ( NSString* )_KeyPath
                             object: ( id )_Object
    {
    id newChangeItem = _Change[ @"new" ];

//  if ( [ newChangeItem isKindOfClass: [ NSNumber class ] ] )
    if ( [ _KeyPath isEqualToString: @"doubleValue" ] )
        [ self.anotherLabel setStringValue: [ NSString stringWithFormat: @"%g", [ ( NSNumber* )newChangeItem doubleValue ] ] ];

//  else if ( [ newChangeItem isKindOfClass: [ NSColor class ] ] )
    else if ( [ _KeyPath isEqualToString: @"backgroundColor" ] )
        {
        [ self.anotherLabel setBackgroundColor: ( NSColor* )newChangeItem ];
        [ self.colorWell setColor: ( NSColor* )newChangeItem ];
        }
    }

- ( void ) awakeFromNib
    {
#if 0
    [ self.sliderLabel addObserver: self
                        forKeyPath: @"doubleValue"
                           options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                           context: NULL ];
#endif

    self.KVOController = [ FBKVOController controllerWithObserver: self ];
    [ self.KVOController observe: self.sliderLabel
                        keyPaths: @[ @"doubleValue", @"backgroundColor" ]
                         options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                          action: @selector( observedPropertiesChange:keyPath:object: ) ];

#if 0
    [ self.KVOController observe: self.sliderLabel
                        keyPaths: @[ @"doubleValue", @"backgroundColor" ]
                         options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                           block:
        ^( NSString* _KeyPath, FBKAppDelegate* _Observer, NSTextField* _Object, NSDictionary* _Change )
            {
            id newChangeItem = _Change[ @"new" ];

//            if ( [ newChangeItem isKindOfClass: [ NSNumber class ] ] )
            if ( [ _KeyPath isEqualToString: @"doubleValue" ] )
                [ self.anotherLabel setStringValue: [ NSString stringWithFormat: @"%g", [ ( NSNumber* )newChangeItem doubleValue ] ] ];

//            else if ( [ newChangeItem isKindOfClass: [ NSColor class ] ] )
            else if ( [ _KeyPath isEqualToString: @"backgroundColor" ] )
                {
                [ self.anotherLabel setBackgroundColor: ( NSColor* )newChangeItem ];
                [ self.colorWell setColor: ( NSColor* )newChangeItem ];
                }
            } ];
#endif

    [ self.sliderLabel setDoubleValue: 20.2131f ];
    [ NSApp sendAction: @selector( generateRandomColor: )
                    to: self
                  from: self.generateRandomColor ];
    }

#pragma mark IBActions
- ( IBAction ) sliderValueChanged: ( id )_Sender
    {
    [ self.sliderLabel setDoubleValue: self.slider.doubleValue ];
    }

- ( IBAction ) generateRandomColor: ( id )_Sender
    {
    dispatch_once_t static onceToken;

    dispatch_once( &onceToken
        , ^( void )
            {
            srand( ( unsigned int )time( NULL ) );
            } );

    CGFloat redComponent = ( rand() % 255 ) / 255.f;
    CGFloat greenComponent = ( rand() % 255 ) / 255.f;
    CGFloat blueComponent = ( rand() % 255 ) / 255.f;

    NSColor* newColor = [ NSColor colorWithCalibratedRed: redComponent
                                                   green: greenComponent
                                                    blue: blueComponent
                                                   alpha: 1 ];

    [ self.sliderLabel setBackgroundColor: newColor ];
    }

#if 0
- ( void ) observeValueForKeyPath: ( NSString* )_KeyPath
                         ofObject: ( id )_Object
                           change: ( NSDictionary* )_Change
                          context: ( void* )_Context
    {
    if ( [ _KeyPath isEqualToString: @"doubleValue" ] )
        [ self.anotherLabel setStringValue: [ NSString stringWithFormat: @"%g", [ _Change[ @"new" ] doubleValue ] ] ];
    }
#endif
@end

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