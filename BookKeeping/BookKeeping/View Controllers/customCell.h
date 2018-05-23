//
//  customCell.h
//  BookKeeping
//
//  Created by JunQiu on 2018/5/23.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customCell : UITableViewCell {
    UILabel *primaryLabel;
    UILabel *secondaryLabel;
    UILabel *descriptionLabel;
}

@property (strong, nonatomic) UILabel *primaryLabel;
@property (strong, nonatomic) UILabel *secondaryLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;

@end
