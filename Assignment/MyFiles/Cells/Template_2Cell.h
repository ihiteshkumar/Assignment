//
//  Template_2Cell.h
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageSubModel.h"

@protocol ShowCollectionViewPageDelegate <NSObject>

-(void) showWebViewPage:(NSString *)titleString withWebUrl:(NSString *)urlString;
@end

@interface Template_2Cell : UITableViewCell

@property (weak, nonatomic) id<ShowCollectionViewPageDelegate> delegate;
@property (strong, nonatomic) IBOutlet UILabel *labelTxt;
-(void) setupSubViewWithModelArray:(NSArray *)subModelArray;

@end
