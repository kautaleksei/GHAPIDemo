//
//  GHDMainWindowController.m
//  GHAPIDemo
//
//  Created by Josh Abernathy on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GHDMainWindowController.h"
#import "GHDLoginViewController.h"
#import "GHDUserViewController.h"
#import "GHGitHubUser.h"

@interface GHDMainWindowController ()
@property (nonatomic, strong) NSViewController *currentViewController;
@end


@implementation GHDMainWindowController

- (id)init {
	self = [super initWithWindowNibName:NSStringFromClass([self class]) owner:self];
	if(self == nil) return nil;
	
	return self;
}


#pragma mark NSWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
	
	GHDLoginViewController *loginViewController = [[GHDLoginViewController alloc] init];
	self.currentViewController = loginViewController;
	
	[self rac_bind:RAC_KEYPATH_SELF(self.currentViewController) 
				to:[[loginViewController.didLoginSubject 
					 where:^BOOL(id x) {
						 return x != nil;
					 }] 
					 select:^(id x) {
						 return [[GHDUserViewController alloc] initWithUserAccount:x];
					 }]];
}


#pragma mark API

@synthesize currentViewController;

- (void)setCurrentViewController:(NSViewController *)vc {
	if(currentViewController == vc) return;
	
	currentViewController = vc;
	
	self.window.contentView = self.currentViewController.view;
}

@end
