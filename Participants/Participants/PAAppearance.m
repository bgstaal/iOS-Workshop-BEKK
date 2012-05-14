//
//  PAAppearance.m
//  Participants
//
//  Created by Bjørn Gunnar Staal on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PAAppearance.h"

@implementation PAAppearance

+ (void)applyAppearence
{
    id table = [UITableView appearance];
    [table setBackgroundColor:[UIColor blackColor]];
    [table setSeparatorColor:[UIColor colorWithWhite:.2f alpha:1.0f]];
    
    id tableLabel = [UILabel appearanceWhenContainedIn:[UITableView class], nil];
    [tableLabel setColor:[UIColor whiteColor]];
    
    id navBar = [UINavigationBar appearance];
    [navBar setTintColor:[UIColor colorWithWhite:.3f alpha:1.0f]];
}

@end
