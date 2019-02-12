//
//  DSTEntryController.m
//  Journal OBJ-C
//
//  Created by Deniz Tutuncu on 2/11/19.
//  Copyright © 2019 Deniz Tutuncu. All rights reserved.
//

#import "DSTEntryController.h"


@implementation DSTEntryController

// MARK: - Properties
+ (DSTEntryController *)sharedInstance {
    static DSTEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DSTEntryController alloc] init];
        sharedInstance.entries = [NSMutableArray new];
        [sharedInstance loadFromPersistenceStore];
    });
    return sharedInstance;
}

- (void)addEntry:(DSTEntry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistenceStore];
}

- (void)removeEntry:(DSTEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistenceStore];
}

- (void)updateEntry:(DSTEntry *)entry withTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
    [self saveToPersistenceStore];
}

- (void)saveToPersistenceStore
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (DSTEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

- (void)loadFromPersistenceStore
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        DSTEntry *entry = [[DSTEntry new] dictionaryCopy:dictionary];
        [self addEntry:entry];
    }
}

@end
