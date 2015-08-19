//
//  MyTableViewCell.m
//  MyImageView
//
//  Created by liqunfei on 15/8/18.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        [self.contentView addSubview:self.headImage];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

@end
