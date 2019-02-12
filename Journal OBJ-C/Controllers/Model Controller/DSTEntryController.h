//
//  DSTEntryController.h
//  Journal OBJ-C
//
//  Created by Deniz Tutuncu on 2/11/19.
//  Copyright © 2019 Deniz Tutuncu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSTEntry.h"


NS_ASSUME_NONNULL_BEGIN

@interface DSTEntryController : NSObject

+ (DSTEntryController *) sharedInstance;

@property (nonatomic, strong) NSMutableArray <DSTEntry*> *entries;

-(void)addEntry: (DSTEntry *)entry;

-(void)removeEntry: (DSTEntry *)entry;

-(void)updateEntry: (DSTEntry *)entry
         withTitle: (NSString *)title
          bodyText: (NSString *)bodyText;

-(void)saveToPersistenceStore;
-(void)loadFromPersistenceStore;

@end

NS_ASSUME_NONNULL_END
