//
//  Language.m
//  CCPos
//
//  Created by Zhu Gang on 6/15/14.
//  Copyright (c) 2014 LogicLink. All rights reserved.
//

#import "Language.h"

@implementation Language

static NSDictionary *g_LanguageDictionary = nil;

+ (NSString*)getiOSLanguage
{
    NSArray *preferredLocalizations = [[NSBundle mainBundle] preferredLocalizations];
    
    return [preferredLocalizations objectAtIndex:0];
}

+(void)setLanguage:(NSString*)language
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setValue:language forKey:@"Language"];
    [prefs synchronize];
}


+(NSString*)getLanguage
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *ret = [prefs objectForKey:@"Language"];
    
    if ([ret length] <=0)
    {
        ret = [Language getiOSLanguage];
        
        if (![ret isEqualToString:@"en"] && ![ret isEqualToString:@"zh-Hans"])
        {
            //如果App第一次启动的时候，语言不是英语或简体中文，就默认为中文
            ret = @"zh-Hans";
        }
        
        [prefs setValue:ret forKey:@"Language"];
        [prefs synchronize];
    }
    
    return ret;
}

+(NSString*)getText:(NSString*)key
{
    if (g_LanguageDictionary == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Language.plist" ofType:nil];
        g_LanguageDictionary = [NSDictionary dictionaryWithContentsOfFile:path];

    }
    
    if (g_LanguageDictionary == nil)
        return key;
	NSDictionary *dictItem = [g_LanguageDictionary objectForKey:key];
    
    NSString *language = [Language getLanguage];
    NSString *ret = [dictItem objectForKey:language];
    if (ret)
        return ret;
    else
        return key;
    
}


@end
