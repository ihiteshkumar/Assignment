//
//  Template_1FullImageCell.m
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "Template_1FullImageCell.h"

@interface Template_1FullImageCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation Template_1FullImageCell

+(CGFloat)getCellHeight {
    return 180.0;
}

-(void)setupSubviews {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *imgURL = self.subModel.imgUrl;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgView.image =  [UIImage imageWithData:data];
        });
    });
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
