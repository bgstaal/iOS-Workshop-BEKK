//
//  PADetailVC.m
//  Participants
//
//  Created by Bjørn Gunnar Staal on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PADetailVC.h"

@interface PADetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@end

@implementation PADetailVC
@synthesize imageView = _imageView;
@synthesize nameLabel = _nameLabel;
@synthesize departmentLabel = _departmentLabel;
@synthesize participantData = _participantData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *firstName = [_participantData valueForKey:@"firstName"];
    NSString *lastName = [_participantData valueForKey:@"lastName"];
    NSString *department = [_participantData valueForKey:@"department"];
    NSString *imageName = [_participantData valueForKey:@"imageName"];
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    self.departmentLabel.text = department;
    [self.imageView setImage:[UIImage imageNamed:imageName]];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setNameLabel:nil];
    [self setDepartmentLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
