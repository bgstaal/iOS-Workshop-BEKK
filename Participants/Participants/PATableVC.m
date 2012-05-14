//
//  PATableVC.m
//  Participants
//
//  Created by Bjørn Gunnar Staal on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PATableVC.h"
#import "PADetailVC.h"

@interface PATableVC ()
@property (strong, nonatomic) NSArray *participants;
@end

@implementation PATableVC
@synthesize participants = _participants;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"participants.json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error)
    {
        NSLog(@"Error: %@", error);
    }
    else 
    {
        self.participants = [json valueForKey:@"participants"];
        NSLog(@"number of participants: %i", self.participants.count);
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.participants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *participant = [self.participants objectAtIndex:indexPath.row];
    NSString *firstName = [participant valueForKey:@"firstName"];
    NSString *lastName = [participant valueForKey:@"lastName"];
    NSString *department = [participant valueForKey:@"department"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    cell.detailTextLabel.text = department;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSDictionary *participant = [self.participants objectAtIndex:indexPath.row];
        [(PADetailVC *)segue.destinationViewController setParticipantData:participant];
    }
}

@end
