//
//  Template_3BannerCell.m
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "Template_3BannerCell.h"
#import "iCarousel.h"
#import "HomePageSubModel.h"

@interface Template_3BannerCell() <iCarouselDataSource, iCarouselDelegate>

@property (weak, nonatomic) IBOutlet iCarousel *carouselView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageControlWidthConstraint;

@property (nonatomic, strong) NSArray *banners;

@end

@implementation Template_3BannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.carouselView setPagingEnabled:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)updateViewWithBannerArray:(NSArray *)bannerList
{
    self.banners = bannerList;
    self.carouselView.dataSource = self;
    self.carouselView.delegate = self;
    self.pageControl.numberOfPages = self.banners.count;
    [self.pageControlWidthConstraint setConstant:16*self.banners.count];
    if ([self.banners count]==1) {
        [self.pageControl setHidden:YES];
    }
    [self.carouselView reloadData];
}
#pragma mark iCarousel methods
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.banners.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    UIView *container;
    UIImageView *myImage;
    
    if (!view) {
        container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 180)];
        myImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, 180)];
        [myImage setBackgroundColor:[UIColor clearColor]];
        [container addSubview:myImage];
        view = container;
    }
    HomePageSubModel *subModel = self.banners[index];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *imgURL = subModel.imgUrl;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
        dispatch_async(dispatch_get_main_queue(), ^{
            myImage.image =  [UIImage imageWithData:data];
        });
    });
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    
    HomePageSubModel *subModel = self.banners[index];
    [self.delegate showBannerWebViewPage:subModel.labelTxt withWebUrl:subModel.webUrl];
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.pageControl.currentPage = carousel.currentItemIndex;
}

@end
