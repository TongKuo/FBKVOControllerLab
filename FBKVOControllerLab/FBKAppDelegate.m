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

@synthesize KVOController = _KVOController;

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
                         keyPath: @"doubleValue"
                         options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                           block:
        ^( FBKAppDelegate* _Observer, NSTextField* _Object, NSDictionary* _Change )
            {
            [ self.anotherLabel setStringValue: [ NSString stringWithFormat: @"%g", [ _Change[ @"new" ] doubleValue ] ] ];
            } ];

    [ self.sliderLabel setDoubleValue: 20.2131f ];
    }

- ( IBAction ) sliderValueChanged: ( id )_Sender
    {
    [ self.sliderLabel setDoubleValue: self.slider.doubleValue ];
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