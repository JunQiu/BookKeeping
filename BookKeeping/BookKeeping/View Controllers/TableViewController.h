//
//  TableViewController.h
//  BookKeeping
//
//  Created by JunQiu on 2018/5/22.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    AppDelegate *mainDelegate;
}

@property (nonatomic, strong) AppDelegate *mainDelegate;

@end
