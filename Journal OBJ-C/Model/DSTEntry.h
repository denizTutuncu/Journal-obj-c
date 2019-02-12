//
//  DSTEntry.h
//  Journal OBJ-C
//
//  Created by Deniz Tutuncu on 2/11/19.
//  Copyright © 2019 Deniz Tutuncu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DSTEntry : NSObject

//MARK: - Pproperties
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *bodyText;
@property (nonatomic, strong) NSDate *timestamp;

//MARK: - Initialization
- (instancetype)initWithTitle:(NSString *)title
                     bodyText:(NSString *)bodyText
                    timestamp:(NSDate *)timestamp;

- (instancetype) dictionaryCopy:(NSDictionary *)dictionary;

// MARK: - Helpers
- (NSDictionary *)dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END
