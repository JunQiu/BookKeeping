//
//  ViewController.m
//  BookKeeping
//
//  Created by JunQiu on 2018/5/21.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lblTable, lblInsert;

/* Comments */
- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)sender {
    
}


/* Comments */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:self.view];
    
    CGRect tableFrame = lblTable.frame;
    CGRect insertFrame = lblInsert.frame;
    
    // Comments
    if (CGRectContainsPoint(tableFrame, touchPoint)) {
        [self performSegueWithIdentifier:@"HomeSegueToTable" sender:self];
    }
    
    // Comments
    if (CGRectContainsPoint(insertFrame, touchPoint)) {
        [self performSegueWithIdentifier:@"HomeSegueToInsert" sender:self];
    }
} // touchesBegan: withEvent:

#pragma mark View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
