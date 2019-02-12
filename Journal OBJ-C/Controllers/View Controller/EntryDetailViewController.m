//
//  EntryDetailViewController.m
//  Journal OBJ-C
//
//  Created by Deniz Tutuncu on 2/11/19.
//  Copyright © 2019 Deniz Tutuncu. All rights reserved.
//

#import "EntryDetailViewController.h"

@interface EntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *entryTextView;

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (self.entry) {
        self.entryTitleTextField.text = self.entry.title;
        self.entryTextView.text = self.entry.bodyText;
    }

}

//MARK: - IBActions
- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        [[DSTEntryController sharedInstance] updateEntry:self.entry withTitle:self.entryTitleTextField.text bodyText:self.entryTextView.text];
    } else {
        DSTEntry *entry = [[DSTEntry alloc]initWithTitle:self.entryTitleTextField.text bodyText:self.entryTextView.text timestamp:[NSDate date]];
        [[DSTEntryController sharedInstance] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)cancelButtonTapped:(id)sender {
    
}
- (IBAction)clearButtonTapped:(id)sender {
    
    self.entryTitleTextField.text = @"";
    self.entryTextView.text = @"";
}

@end
