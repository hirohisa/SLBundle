//
//  AppDelegate.m
//  SLBundle Example
//
//  Created by Hirohisa Kawasaki on 2014/05/30.
//  Copyright (c) 2014年 Hirohisa Kawasaki. All rights reserved.
//

#import "AppDelegate.h"
#import <SLBundle/SLBundle.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *test;
    test = [[NSBundle mainBundle] localizedStringForKey:@"hello" value:@"" table:@"Example"];
    NSLog(@"%@", test); // bonjour

    // check excluding language
    [SLBundle mainBundle].exclusionLanguageCodes = @[@"fr"];
    test = [[SLBundle mainBundle] localizedStringForKey:@"hello" value:@"" table:@"Example"];
    NSLog(@"%@", test); // hello

    // check standard language
    [SLBundle mainBundle].standardLanguageCode = @"ja";
    test = [[SLBundle mainBundle] localizedStringForKey:@"hello" value:@"" table:@"Example"];
    NSLog(@"%@", test); // こんにちは

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
