//
//  GHDLoginView.h
//  GHAPIDemo
//
//  Created by Josh Abernathy on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface GHDLoginView : NSView

@property (assign) IBOutlet NSTextField *usernameTextField;
@property (assign) IBOutlet NSTextField *passwordTextField;
@property (assign) IBOutlet NSButton *loginButton;
@property (assign) IBOutlet NSTextField *successTextField;

+ (id)view;

@end
