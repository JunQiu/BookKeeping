//
//  Data.m
//  BookKeeping
//
//  Created by JunQiu on 2018/5/21.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import "Data.h"

@implementation Data
@synthesize title, amount, date, description;

- (id)initWithData:(NSString *)t theAmount:(double)a theDate:(NSString *)d theDescription:(NSString *)dd {
    if (self = [super init]) {
        [self setTitle:t];
        [self setAmount:a];
        [self setDate:d];
        [self setDescription:dd];
    }
    return self;
}

@end
