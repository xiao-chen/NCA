//
//  LockViewController.m
//  NCAssistance
//
//  Created by Yuyi Zhang on 5/6/13.
//  Copyright (c) 2013 Camel. All rights reserved.
//

#import "LockViewController.h"
#import "Constants.h"
#import "AppDelegate.h"

@interface LockViewController ()

@property (nonatomic,assign) NSInteger failedLogins;

@end

@implementation LockViewController

@synthesize failedLogins;

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
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileDir = [documentsDirectory stringByAppendingPathComponent:@"loginAttempts"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:fileDir]) {
        self.failedLogins = [[[NSString alloc]initWithContentsOfFile:fileDir encoding:NSUTF8StringEncoding error:nil] intValue];
        if (self.failedLogins > 10) {
            // file has sth wrong. Probably being hacked...
            self.failedLogins = 10;
        }
    }
    else {
        self.failedLogins = 10;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // save failedLogins to disk
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileDir = [documentsDirectory stringByAppendingPathComponent:@"loginAttempts"];
    [[[NSNumber numberWithInteger:self.failedLogins] stringValue] writeToFile:fileDir atomically:YES encoding:NSUTF8StringEncoding error:nil];
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
                [self setFailedLogins:10];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else {
                self.failedLogins--;
                self.hoverLbl.text = @"Oops, your password is wrong!";
                self.cast.text = @"Don't do it wrong";
                self.now.text = @"";
                self.magic.text = [[[NSNumber numberWithInteger: self.failedLogins] stringValue] stringByAppendingString:@" Attempts Left."];
                self.codeIn.text = @"";
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

- (IBAction)forgotPassword:(id)sender {
    //(AppDelegate *)[[UIApplication sharedApplication]
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"todo"
                                                    message:@"not implemented yet.."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
