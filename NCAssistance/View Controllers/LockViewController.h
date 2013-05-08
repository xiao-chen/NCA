//
//  LockViewController.h
//  NCAssistance
//
//  Created by Yuyi Zhang on 5/6/13.
//  Copyright (c) 2013 Camel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LockViewControllerDelegate
- (BOOL) verify: (NSString *)code;
@end

@interface LockViewController : UIViewController

@property (nonatomic, weak) IBOutlet id <LockViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *codeIn;
@property (weak, nonatomic) IBOutlet UILabel *hoverLbl;
- (IBAction)touchUpOutside:(id)sender;  //todo

@end
