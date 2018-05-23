//
//  AppDelegate.h
//  BookKeeping
//
//  Created by JunQiu on 2018/5/21.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    NSString *databaseName;
    NSString *databasePath;
    
    // Records listed in table-records of database.
    NSMutableArray *record;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *record;

- (void)checkAndCreateDatabase;
- (void)readDataFromDatabase;
- (BOOL)insertDataIntoDatabase:(Data *)record;

@end

