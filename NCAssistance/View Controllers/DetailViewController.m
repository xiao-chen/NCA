//
//  DetailViewController.m
//  iDontKnow
//
//  Created by Yuyi Zhang on 5/2/13.
//  Copyright (c) 2013 Camel. All rights reserved.
//

#import "DetailViewController.h"
#import "EditViewController.h"
#import "Password.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize record;

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

    // Update the user interface for the detail item.
    if (self.record) {
        self.titleLabel.text = self.record.title;
        self.usernameLabel.text = self.record.username;
        self.passwordLabel.text = self.record.password;
        self.websiteLabel.text = self.record.website;
        self.notesTxt.text = self.record.notes;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"EditItem"]) {
        UINavigationController *nc = [segue destinationViewController];
        EditViewController *editViewController = (EditViewController*) nc.topViewController;
        editViewController.record = self.record;
    }
}

#pragma mark - Unwind segues
- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"DoneEditing"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelEditing"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

@end
