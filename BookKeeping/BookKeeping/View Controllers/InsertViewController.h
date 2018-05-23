//
//  InsertViewController.h
//  BookKeeping
//
//  Created by JunQiu on 2018/5/22.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsertViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *txTitle;
    IBOutlet UITextField *txAmount;
    IBOutlet UITextField *txDate;
    IBOutlet UITextField *txDescription;
}

@property (strong, nonatomic) IBOutlet UITextField *txTitle;
@property (strong, nonatomic) IBOutlet UITextField *txAmount;
@property (strong, nonatomic) IBOutlet UITextField *txDate;
@property (strong, nonatomic) IBOutlet UITextField *txDescription;

@end
