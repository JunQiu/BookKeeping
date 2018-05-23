//
//  Data.h
//  BookKeeping
//
//  Created by JunQiu on 2018/5/21.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject {
    NSString *title;
    double amount;
    NSString *date;
    NSString *description;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic) double amount;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *description;

- (id)initWithData:(NSString *)t theAmount:(double)a theDate:(NSString *)d theDescription:(NSString *)dd;

@end
