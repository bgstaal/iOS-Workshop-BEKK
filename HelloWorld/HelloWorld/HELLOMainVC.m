//
//  HELLOMainVC.m
//  HelloWorld
//
//  Created by Bjørn Gunnar Staal on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HELLOMainVC.h"

@interface HELLOMainVC ()

@end

@implementation HELLOMainVC
@synthesize textLabel = _textLabel;

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTextLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonClicked:(id)sender 
{
    self.textLabel.text = @"iOS er kult!";
}

- (void)dealloc 
{
    [super dealloc];
}
@end
