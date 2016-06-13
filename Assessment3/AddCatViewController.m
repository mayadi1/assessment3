//
//  AddCatViewController.m
//  Assessment3
//
//  Created by Ben Bueltmann on 1/25/16.
//  Copyright © 2016 Mobile Makers. All rights reserved.
//

#import "AddCatViewController.h"
#import "Cat.h"
#import "Owner.h"
#import "AppDelegate.h"

@interface AddCatViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *breedTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@property NSManagedObjectContext *moc;
@end

@implementation AddCatViewController

//TODO: UPDATE CODE ACCORIDNGLY

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;

    self.title = @"Add Cat";
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self resignFirstResponder];
    return YES;
}
- (IBAction)onPressedUpdateCat:(UIButton *)sender
{
    
    
    Cat *cat = [Cat fetchCatWithName:self.nameTextField.text];
     cat.breed = self.breedTextField.text;
    cat.color=self.colorTextField.text;
    
   
        [self.passedOwner addCatObject:cat];
        NSError *error = nil;
        [self.moc save:&error];
        
    
    
    self.nameTextField.text = nil;
    self.colorTextField.text = nil;
    self.breedTextField.text = nil;
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
