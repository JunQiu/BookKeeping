//
//  AppDelegate.m
//  BookKeeping
//
//  Created by JunQiu on 2018/5/21.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import "AppDelegate.h"
#import "FMDatabase.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize databaseName, databasePath, record;

#pragma mark Database Methods
/* Check and create database. */
- (void)checkAndCreateDatabase {
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:self.databasePath];
    
    // Database exist.
    if (success) {
        return;
    }
    
    // Database does not exist.
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseName];

    [fileManager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil];
}

/* Read dara from database. */
- (void)readDataFromDatabase {
    // Clear array of records
    [self.record removeAllObjects];
    
    // FMDatabase object
    FMDatabase *database = [FMDatabase databaseWithPath:self.databasePath];
    
    //Open database.
    [database open];
    
    NSString *selectSQL = @"select * from records";
    FMResultSet *fmResult = [database executeQuery:selectSQL];
    
    while ([fmResult next]) {
        NSString *title = [fmResult stringForColumn:@"Title"];
        double amount = [fmResult doubleForColumn:@"Amount"];
        NSString *date = [fmResult stringForColumn:@"Date"];
        NSString *desciption = [fmResult stringForColumn:@"Description"];
        
        Data *data = [[Data alloc] initWithData:title theAmount:amount theDate:date theDescription:desciption];
        [self.record addObject:data];

// -- Debug info -----------------------------------------
        
        // NSLog(@"%@, %f, %@, %@", data.title, data.amount, data.date, data.description);
        
// -- Debug info -----------------------------------------

    }
    // Close database.
    [database close];
}

/* Insert data into database. */
- (BOOL)insertDataIntoDatabase:(Data *)record {
    BOOL returnCode = YES;

    // FMdatabase object
    FMDatabase *database = [FMDatabase databaseWithPath:self.databasePath];

    // Open database
    [database open];

    NSString *insertSQL = @"insert into records values(NULL, ?, ?, ?, ?)";
 
    NSString *stringRecordAmount = [NSString stringWithFormat:@"%f", record.amount];
    
    returnCode = [database executeUpdate:insertSQL, record.title, stringRecordAmount, record.date, record.description];
    
    if (returnCode) {
        NSLog(@"Insert into row ID = %lld", database.lastInsertRowId);
    } else {
        NSLog(@"Error: %@", database.lastError);
        returnCode = NO;
    }

    // Close database
    [database close];

    return returnCode;
}


#pragma mark App Methods
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.record = [[NSMutableArray alloc] init];
    self.databaseName = @"bookKeeping.sqlite";
    
    // Document path
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [documentPath objectAtIndex:0];
    
    self.databasePath = [documentDir stringByAppendingPathComponent:self.databaseName];
    
    // Check and create database
    [self checkAndCreateDatabase];
    
    // Read data from database
    [self readDataFromDatabase];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
