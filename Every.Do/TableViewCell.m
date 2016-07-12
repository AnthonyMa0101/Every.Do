//
//  TableViewCell.m
//  Every.Do
//
//  Created by Anthony Ma on 2016-07-12.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    self.titleLabel.text = @"";
    self.descriptionLabel.text = @"";
    self.numberLabel.text = @"";
}


- (IBAction)completeButton:(id)sender {
}
@end


