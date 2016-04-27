//
//  HomePageSubModel.m
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "HomePageSubModel.h"

@implementation HomePageSubModel

-(id)initWithData:(NSDictionary *)data {
    
    self.labelTxt = [data valueForKey:@"label"];
    self.imgUrl = [data valueForKey:@"image"];
    self.webUrl = [data valueForKey:@"web-url"];
    return self;
}
+(NSArray *) getDataArray: (NSArray *) data
{
    NSMutableArray * modelArray = [[NSMutableArray alloc] init];
    for(NSDictionary * dict in data)
    {
        HomePageSubModel * model = [[HomePageSubModel alloc] initWithData:dict];
        [modelArray addObject:model];
    }
    return modelArray;
}
@end
