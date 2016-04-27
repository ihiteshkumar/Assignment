//
//  HomePageModel.m
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "HomePageModel.h"
#import "HomePageSubModel.h"

@implementation HomePageModel

-(id)initWithData:(NSDictionary *)data {
    
    self.imgUrl = [data valueForKey:@"image"];
    self.labelTxt = [data valueForKey:@"label"];
    self.items = [HomePageSubModel getDataArray:[data valueForKey:@"items"] ];
    NSString *templateTypee = [data valueForKey:@"template"];
    if ([templateTypee isEqualToString:@"product-template-1"])
    {
        self.type = TemplateType1;
    }
    if ([templateTypee isEqualToString:@"product-template-2"])
    {
        self.type = TemplateType2;
    }
    if ([templateTypee isEqualToString:@"product-template-3"])
    {
        self.type = TemplateType3;
    }
    return self;
}

+(NSArray *) getDataArray: (NSArray *) data
{
    NSMutableArray * modelArray = [[NSMutableArray alloc] init];
    for(NSDictionary * dict in data)
    {
        HomePageModel * model = [[HomePageModel alloc] initWithData:dict];
        [modelArray addObject:model];
    }
    return modelArray;
}

@end
