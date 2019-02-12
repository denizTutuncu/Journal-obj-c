//
//  EntryDetailViewController.h
//  Journal OBJ-C
//
//  Created by Deniz Tutuncu on 2/11/19.
//  Copyright © 2019 Deniz Tutuncu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSTEntry.h"
#import "DSTEntryController.h"


NS_ASSUME_NONNULL_BEGIN

@class DSTEntry;

@interface EntryDetailViewController : UIViewController

@property (nonatomic, strong) DSTEntry *entry;

- (void)updateViews;

@end

NS_ASSUME_NONNULL_END
