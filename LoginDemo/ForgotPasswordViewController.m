//
//  ForgotPasswordViewController.m
//  LoginDemo
//
//  Created by Irfan Lone on 3/12/16.
//  Copyright © 2016 Ilone Labs. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailTextfield;

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)closePressed:(id)sender {
    if ([self.emailTextfield isFirstResponder]) {
        [self.emailTextfield resignFirstResponder];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendPassword:(id)sender {
    if ([self.emailTextfield isFirstResponder]) {
        [self.emailTextfield resignFirstResponder];
    }
    // Newtwork request for forgot password
    // on success
    // Instead of creating a new screen for this, I am using the native UIAlertController.
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Check your email" message:@"please check you email for all the instructions" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Go back to Login" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    // on failure.
    // let the user know of the request failed.
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
