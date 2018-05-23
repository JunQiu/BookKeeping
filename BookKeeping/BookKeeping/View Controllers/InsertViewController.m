//
//  InsertViewController.m
//  BookKeeping
//
//  Created by JunQiu on 2018/5/22.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import "InsertViewController.h"
#import "AppDelegate.h"

@interface InsertViewController ()

@end

@implementation InsertViewController
@synthesize txTitle, txAmount, txDate, txDescription;


- (IBAction)insertRecord:(id)sender {
    
    if ([[self remove_whitespace:txTitle.text] length] == 0) {
        // If records title is null, pop out a alert to tell title cannot be null.
        
        NSString *warnMSG = @"Title cannot be empty!";
        UIAlertController *warnAlert = [UIAlertController alertControllerWithTitle:@"Input Title" message:warnMSG preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [warnAlert addAction:ok];
        [self presentViewController:warnAlert animated:YES completion:nil];
        
    } else {
        AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        Data *records = [[Data alloc] initWithData:txTitle.text theAmount:[txAmount.text doubleValue] theDate:txDate.text theDescription:txDescription.text];
        
// -- Debug info -----------------------------------------
        // NSLog(@"%@, %f, %@, %@", records.title, records.amount, records.date, records.description);
// -- Debug info -----------------------------------------

        
        BOOL returnCode = [mainDelegate insertDataIntoDatabase:records];
        
        NSString *returnMSG = @"Record inserted.";
        if (returnCode == NO)
            returnMSG = @"Record insert failed.";
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Insert" message:returnMSG preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

/* Remove whitspace in the string */
- (NSString *)remove_whitespace:(NSString *)string {
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    string = [string stringByTrimmingCharactersInSet:whitespace];
    return string;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
