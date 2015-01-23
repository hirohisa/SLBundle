//
//  SLBundle.m
//  SLBundle
//
//  Created by Hirohisa Kawasaki on 2014/05/30.
//  Copyright (c) 2014年 Hirohisa Kawasaki. All rights reserved.
//

#import "SLBundle.h"

@interface SLBundle ()

@property (nonatomic, strong) NSString *languageCode;

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
        _standardLanguageCode = @"en";
        _exclusionLanguageCodes = @[];
    }
    return self;
}

#pragma mark - getter

- (NSString *)languageCode
{
    if (_languageCode) {
        return _languageCode;
    }

    [self resetLanguageCode];
    return _languageCode;
}

- (void)setStandardLanguageCode:(NSString *)standardLanguageCode
{
    _standardLanguageCode = standardLanguageCode;
    [self resetLanguageCode];
}

- (void)setExclusionLanguageCodes:(NSArray *)exclusionLanguageCodes
{
    _exclusionLanguageCodes = exclusionLanguageCodes;
    [self resetLanguageCode];
}

- (void)resetLanguageCode
{
    _languageCode = self.standardLanguageCode;
    NSString *languageCode = [[NSLocale preferredLanguages] firstObject];
    if ([[[NSBundle mainBundle] localizations] containsObject:languageCode] &&
        ![self.exclusionLanguageCodes containsObject:languageCode]) {
        _languageCode = languageCode;
    }
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
