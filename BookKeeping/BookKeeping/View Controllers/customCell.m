//
//  customCell.m
//  BookKeeping
//
//  Created by JunQiu on 2018/5/23.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import "customCell.h"

@implementation customCell
@synthesize primaryLabel, secondaryLabel, descriptionLabel;

// Initialize
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // primaryLable
        primaryLabel = [[UILabel alloc] init];
        primaryLabel.textAlignment = NSTextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:18];
        primaryLabel.backgroundColor = [UIColor clearColor];
        primaryLabel.textColor = [UIColor blackColor];
        
        // secondaryLable
        secondaryLabel = [[UILabel alloc] init];
        secondaryLabel.textAlignment = NSTextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:16];
        secondaryLabel.backgroundColor = [UIColor clearColor];
        secondaryLabel.textColor = [UIColor blueColor];
        
        // descriptionLabel
        descriptionLabel = [[UILabel alloc] init];
        descriptionLabel.textAlignment = NSTextAlignmentLeft;
        descriptionLabel.font = [UIFont systemFontOfSize:12];
        descriptionLabel.backgroundColor = [UIColor clearColor];
        descriptionLabel.textColor = [UIColor blueColor];
        
        // Add to screen
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:descriptionLabel];
        
    }
    return self;
}

// Layout
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame;
    
    // Title
    frame = CGRectMake(15, 5, 200, 20);
    primaryLabel.frame = frame;
    
    // Amount
    frame = CGRectMake(230, 5, 120, 20);
    secondaryLabel.frame = frame;
    
    // Description
    frame = CGRectMake(15, 30, 345, 20);
    descriptionLabel.frame = frame;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
