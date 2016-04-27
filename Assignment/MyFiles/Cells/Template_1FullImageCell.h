//
//  Template_1FullImageCell.h
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageSubModel.h"

@interface Template_1FullImageCell : UITableViewCell

@property (nonatomic) HomePageSubModel * subModel;

+(CGFloat)getCellHeight;
-(void) setupSubviews;
@end
