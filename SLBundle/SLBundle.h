//
//  SLBundle.h
//  SLBundle
//
//  Created by Hirohisa Kawasaki on 2014/05/30.
//  Copyright (c) 2014年 Hirohisa Kawasaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLBundle : NSObject

@property (nonatomic, strong) NSString *standardLanguageCode; // default standard language code is `en`
@property (nonatomic, strong) NSArray *exclusionLanguageCodes; // default is []

+ (instancetype)mainBundle;

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;

@end

#define SLLocalizedString(key) \
[[SLBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]
#define SLLocalizedStringFromTable(key, tbl) \
[[SLBundle mainBundle] localizedStringForKey:(key) value:@"" table:(tbl)]