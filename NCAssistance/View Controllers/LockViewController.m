//
//  LockViewController.m
//  NCAssistance
//
//  Created by Yuyi Zhang on 5/6/13.
//  Copyright (c) 2013 Camel. All rights reserved.
//

#import "LockViewController.h"
#import "Constants.h"

@interface LockViewController ()

@end

@implementation LockViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text field delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.codeIn) {
        [textField resignFirstResponder];
        if (self.codeIn.text.length > 0) {
            if ([self.delegate verify:self.codeIn.text]) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else {
                self.hoverLbl.text = @"Oops, your password is wrong!";
            }
        }
        else {
            self.hoverLbl.text = @"So, do you have the code?";
        }
            
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 150; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (IBAction)touchUpOutside:(id)sender {
    [self.codeIn resignFirstResponder];
}
@end
