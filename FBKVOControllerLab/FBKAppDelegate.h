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

@class FBKVOController;

@interface FBKAppDelegate : NSObject <NSApplicationDelegate>
    {
@private
    __weak NSWindow* _window;

    __weak NSSlider*        _slider;
    __weak NSTextField*     _sliderLabel;
    __weak NSTextField*     _anotherLabel;

    __weak NSButton*        _generateRandomColor;
    __weak NSColorWell*     _colorWell;
    }

@property ( atomic, weak ) IBOutlet NSWindow* window;

@property ( atomic, weak ) IBOutlet NSSlider* slider;
@property ( atomic, weak ) IBOutlet NSTextField* sliderLabel;
@property ( atomic, weak ) IBOutlet NSTextField* anotherLabel;

@property ( atomic, weak ) IBOutlet NSButton* generateRandomColor;
@property ( atomic, weak ) IBOutlet NSColorWell* colorWell;

@property ( atomic, strong ) FBKVOController* KVOController;

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