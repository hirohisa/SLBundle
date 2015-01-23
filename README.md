SLBundle
========

SLBundle provides to specify a standard language for iOS.

First or second primary language is English in iOS's localization. If you change primary language, SLBundle can do.

Usage
========

**Select standard language**
```objc
[SLBundle mainBundle].standardLanguageCode = @"ja";
```

**Excluding languages**
```objc
[SLBundle mainBundle].exclusionLanguageCodes = @[@"en"];
```

**localize**
```objc
NSString *string = SLLocalizedString(@"key");
```
or
```objc
NSString *string = [[SLBundle mainBundle] localizedStringForKey:@"key" value:@"" table:@"Example"];
```

Example
========

If you are Japanese, you want to develop in Japanese but your product is not support in Japanese.

```objc
#ifdef DEBUG
    [SLBundle mainBundle].standardLanguageCode = @"ja";
#else
    [SLBundle mainBundle].exclusionLanguageCodes = @[@"ja"];
#endif
```
