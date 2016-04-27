//
//  HomePageModel.h
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TemplateType) {
        TemplateType1 = 0,
        TemplateType2,
        TemplateType3
};

@interface HomePageModel : NSObject

@property (nonatomic) TemplateType type;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *labelTxt;
@property (nonatomic, strong) NSArray *items;

-(id) initWithData: (NSDictionary *) dict;
+(NSArray *) getDataArray: (NSArray *) data;

@end
