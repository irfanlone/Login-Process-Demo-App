//
//  ViewController.m
//  LoginDemo
//
//  Created by Irfan Lone on 3/11/16.
//  Copyright © 2016 Ilone Labs. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "ForgotPasswordViewController.h"

static NSInteger kConstraintPriorityHigh = 999;
static NSInteger kConstraintPriorityLow = 1;

@interface LoginViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (strong, nonatomic) IBOutlet UIButton *signInButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)signIn:(id)sender {
    
    if ([self.emailTextField isFirstResponder]){
        [self.emailTextField resignFirstResponder];
    } else if ([self.passwordTextfield isFirstResponder]) {
        [self.passwordTextfield resignFirstResponder];
    }
}

- (IBAction)forgotPasswordClicked:(id)sender {
    ForgotPasswordViewController * forgotPasswordVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"forgotPassword"];
    [self presentViewController:forgotPasswordVC animated:YES completion:nil];
}

- (IBAction)signUp:(id)sender {
    SignUpViewController * signUpViewController = [[UIStoryboard storyboardWithName:@"SignUp" bundle:nil] instantiateViewControllerWithIdentifier:@"Account"];
    [self presentViewController:signUpViewController animated:YES completion:nil];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    self.topConstraint.priority = kConstraintPriorityLow;
    return NO;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.emailTextField || textField == self.passwordTextfield) {
        self.topConstraint.priority = kConstraintPriorityHigh;
        return YES;
    }
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
}

- (IBAction)editingChanged:(id)sender {
    self.signInButton.enabled = (self.emailTextField.text.length > 0 && self.passwordTextfield.text.length > 0);
    NSLog(@"%lu",self.passwordTextfield.text.length);
    NSLog(@"%lu",self.emailTextField.text.length);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
