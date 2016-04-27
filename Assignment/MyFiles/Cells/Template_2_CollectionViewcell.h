//
//  Template_2_CollectionViewcell.h
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageSubModel.h"

@interface Template_2_CollectionViewcell : UICollectionViewCell

@property(nonatomic) HomePageSubModel *subModel;
-(void)setupSubVIew;

@end
