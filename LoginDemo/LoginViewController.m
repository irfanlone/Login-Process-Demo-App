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
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(outsideTapped:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGestureRecognizer];

}

- (void)outsideTapped:(id)sender {
    if ([self.emailTextField isFirstResponder]) {
        [self.emailTextField resignFirstResponder];
    } else if([self.passwordTextfield isFirstResponder])  {
        [self.passwordTextfield resignFirstResponder];
    }
    self.topConstraint.priority = kConstraintPriorityLow;
}

- (IBAction)signIn:(id)sender {
    if ([self.emailTextField isFirstResponder]) {
        [self.emailTextField resignFirstResponder];
    } else if([self.passwordTextfield isFirstResponder])  {
        [self.passwordTextfield resignFirstResponder];
    }
    self.topConstraint.priority = kConstraintPriorityLow;
    // show progress indicator
    // Send a Network request in the background for validating the user.
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
    if (textField == self.emailTextField) {
        [self.passwordTextfield becomeFirstResponder];
        
    } else if (textField == self.passwordTextfield) {
        [textField resignFirstResponder];
    }
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
    // only enable the signIn button if there is value present in both fields.
    self.signInButton.enabled = (self.emailTextField.text.length > 0 && self.passwordTextfield.text.length > 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
