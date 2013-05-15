//
//  EditViewController.m
//  NCAssistance
//
//  Created by Yuyi Zhang on 5/12/13.
//  Copyright (c) 2013 Camel. All rights reserved.
//

#import "EditViewController.h"
#import "Password.h"

@interface EditViewController ()

@end

@implementation EditViewController

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

    if (self.record) {
        self.titleIn.text = self.record.title;
        self.userIn.text = self.record.username;
        self.passwordIn.text = self.record.password;
        self.websiteIn.text = self.record.website;
        self.notesIn.text = self.record.notes;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text field delegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.titleIn) {
        [textField resignFirstResponder];
		[self.userIn becomeFirstResponder];
    }
	else if  (textField == self.userIn) {
		[textField resignFirstResponder];
		[self.passwordIn becomeFirstResponder];
	}
	else if (textField == self.passwordIn) {
		[textField resignFirstResponder];
		[self.websiteIn becomeFirstResponder];
	}
	else if (textField == self.websiteIn) {
		[textField resignFirstResponder];
		[self.notesIn becomeFirstResponder];
	}
	else if (textField == self.notesIn) {
		[textField resignFirstResponder];
	}
    return YES;
}

@end
