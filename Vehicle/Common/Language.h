//
//  Language.h
//  CCPos
//
//  Created by Zhu Gang on 6/15/14.
//  Copyright (c) 2014 LogicLink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Language : NSObject

+ (NSString*)getiOSLanguage;
+ (NSString*)getLanguage;
+ (void)setLanguage:(NSString*)language;
+ (NSString*)getText:(NSString*)key;


@end
