//
//  Template_2Cell.m
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "Template_2Cell.h"
#import "Template_2_CollectionViewcell.h"
#import "HomePageSubModel.h"
#import "HomeVC.h"

@interface Template_2Cell() <UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) HomePageSubModel *homePageSubModel;
@property NSArray * homePageSubModelArray;
@end

@implementation Template_2Cell

-(void)setupSubViewWithModelArray:(NSArray *)subModelArray{
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.homePageSubModelArray = subModelArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self registerNibs];
}

-(void)registerNibs {
        [[self collectionView] registerNib:[UINib nibWithNibName:@"Template_2_CollectionViewcell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Template_2_CollectionViewcell"];
}

#pragma mark UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.homePageSubModelArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.homePageSubModel = self.homePageSubModelArray[indexPath.row];
   
    Template_2_CollectionViewcell *myCollCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Template_2_CollectionViewcell" forIndexPath:indexPath];
    
    myCollCell.subModel = self.homePageSubModel;
    [myCollCell setupSubVIew];
    return myCollCell;
}

#pragma mark UICollectionViewDelegate Methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.homePageSubModel = self.homePageSubModelArray[indexPath.row];
    [self.delegate showWebViewPage:self.homePageSubModel.labelTxt withWebUrl:self.homePageSubModel.webUrl];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
