//
//  SLBundle.m
//  SLBundle
//
//  Created by Hirohisa Kawasaki on 2014/05/30.
//  Copyright (c) 2014年 Hirohisa Kawasaki. All rights reserved.
//

#import "SLBundle.h"

@interface SLBundle ()

@property (nonatomic, readonly) NSString *languageCode;

@end

@implementation SLBundle

+ (instancetype)mainBundle
{
    static dispatch_once_t onceToken;
    __strong static SLBundle *_shared = nil;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.standardLanguageCode = @"en";
        self.exclusionLanguageCodes = @[];
    }
    return self;
}

#pragma mark - getter

- (NSString *)languageCode
{
    NSString *languageCode = [[NSLocale preferredLanguages] firstObject];
    if ([[[NSBundle mainBundle] localizations] containsObject:languageCode] &&
        ![self.exclusionLanguageCodes containsObject:languageCode]) {
        return languageCode;
    }

    return self.standardLanguageCode;
}

#pragma mark - public method

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:self.languageCode ofType:@"lproj"];
    NSString *localizedString = [[NSBundle bundleWithPath:path] localizedStringForKey:key value:value table:tableName];

    if (localizedString) {
        return localizedString;
    }
    return key;
}

@end
