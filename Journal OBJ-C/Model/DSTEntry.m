//
//  DSTEntry.m
//  Journal OBJ-C
//
//  Created by Deniz Tutuncu on 2/11/19.
//  Copyright © 2019 Deniz Tutuncu. All rights reserved.
//


#import "DSTEntry.h"

@implementation DSTEntry


- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)dictionaryCopy:(NSDictionary *)dictionary;
{
    NSString *title = dictionary[@"title"];
    NSString *bodyText = dictionary[@"bodyText"];
    NSDate *timestamp = dictionary[@"timestamp"];
    
    return [self initWithTitle:title bodyText:bodyText timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation;
{
    return @{
             @"title": self.title,
             @"bodyText": self.bodyText,
             @"timestamp": self.timestamp
             };
}

@end
