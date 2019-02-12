//
//  DSTEntryListTableViewController.m
//  Journal OBJ-C
//
//  Created by Deniz Tutuncu on 2/11/19.
//  Copyright © 2019 Deniz Tutuncu. All rights reserved.
//

#import "DSTEntryListTableViewController.h"

@interface DSTEntryListTableViewController ()

@end

@implementation DSTEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[DSTEntryController sharedInstance] loadFromPersistenceStore];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DSTEntryController sharedInstance]entries]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    DSTEntry *entry = [[DSTEntryController sharedInstance] entries][indexPath.row];
    cell.textLabel.text = entry.title;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timestamp];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DSTEntry *entry = [[DSTEntryController sharedInstance] entries][indexPath.row];
        [[DSTEntryController sharedInstance]removeEntry:entry];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ToDetailVC"]) {
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        EntryDetailViewController *destinationVC  = segue.destinationViewController;
        DSTEntry *entry = [[DSTEntryController sharedInstance]entries][index.row];
        destinationVC.entry = entry;
    }
}

@end
