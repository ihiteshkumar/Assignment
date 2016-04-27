//
//  Template_3BannerCell.h
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShowBannerWebViewPageDelegate <NSObject>
-(void) showBannerWebViewPage:(NSString *)titleString withWebUrl:(NSString *)urlString;
@end

@interface Template_3BannerCell : UITableViewCell

-(void)updateViewWithBannerArray:(NSArray *)bannerList;
@property (weak, nonatomic) id<ShowBannerWebViewPageDelegate> delegate;


@end
