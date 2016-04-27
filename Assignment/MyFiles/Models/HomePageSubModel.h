//
//  HomePageSubModel.h
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePageSubModel : NSObject

@property (nonatomic, strong) NSString *labelTxt;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *webUrl;

-(id) initWithData: (NSDictionary *) dict;
+(NSArray *) getDataArray: (NSArray *) data;
@end
