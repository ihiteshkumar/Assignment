//
//  Template_2_CollectionViewcell.m
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "Template_2_CollectionViewcell.h"

@interface Template_2_CollectionViewcell()
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *ProductName;

@end

@implementation Template_2_CollectionViewcell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}
-(void)setupSubVIew {
    self.ProductName.text = self.subModel.labelTxt;
    self.productImage.image = nil;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *imgURL = self.subModel.imgUrl;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.productImage.image =  [UIImage imageWithData:data];
        });
    });
}

@end
