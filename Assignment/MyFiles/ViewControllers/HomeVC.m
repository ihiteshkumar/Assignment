//
//  HomeVC.m
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "HomeVC.h"
#import "Template_1FullImageCell.h"
#import "Template_2Cell.h"
#import "HomePageModel.h"
#import "HomePageSubModel.h"
#import "Template_3BannerCell.h"
#import "WebViewController.h"

@interface HomeVC ()<UITableViewDelegate, UITableViewDataSource, ShowCollectionViewPageDelegate, ShowBannerWebViewPageDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray * homePageModelArray;
@property NSArray *itemArray;
@property (nonatomic, strong) HomePageModel * homePageModel;
@property (nonatomic, strong) HomePageSubModel * homePageSubModel;

@end
@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MY APP";
    [self.tableView registerNib:[UINib nibWithNibName:@"Template_2Cell" bundle:nil] forCellReuseIdentifier:@"Template_2Cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"Template_1FullImageCell" bundle:nil] forCellReuseIdentifier:@"Template_1FullImageCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"Template_3BannerCell" bundle:nil] forCellReuseIdentifier:@"Template_3BannerCell"];

    [self loadJson];
}
-(void)loadJson {
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"f_two" ofType:@"json"];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error: NULL];
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    [self response:responseArray];
}

-(void) response: (NSArray *) jsonData
{
    self.homePageModelArray = [HomePageModel getDataArray:jsonData];
}


#pragma mark - Table View Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.homePageModelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    self.homePageModel = self.homePageModelArray[indexPath.row];

    UITableViewCell * myCell;
    if (self.homePageModel.type == 0) {
        Template_1FullImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Template_1FullImageCell" forIndexPath:indexPath];
        
        cell.subModel = self.homePageModel.items[0];
        [cell setupSubviews];
        
        myCell = cell;
    }
    if (self.homePageModel.type == 1) {
        Template_2Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Template_2Cell" forIndexPath:indexPath];
        [cell setupSubViewWithModelArray:self.homePageModel.items];
        cell.labelTxt.text = self.homePageModel.labelTxt;
        myCell = cell;
        cell.delegate = self;
    }
    if (self.homePageModel.type == 2) {
        
        Template_3BannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Template_3BannerCell" forIndexPath:indexPath];
        
        [cell updateViewWithBannerArray:self.homePageModel.items];
        cell.delegate = self;
        myCell = cell;
        
    }
    return myCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.homePageModel = self.homePageModelArray[indexPath.row];
    if (self.homePageModel.type == 0) {
        WebViewController *temp = [[WebViewController alloc] init];
        HomePageSubModel *subModel = self.homePageModel.items[0];
        temp.titleString = subModel.labelTxt;
        temp.urlString = subModel.webUrl;
        [self.navigationController pushViewController:temp animated:YES];
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    self.homePageModel = self.homePageModelArray[indexPath.row];
    CGFloat height  = 0;
    if (self.homePageModel.type == 0) {
        height = [Template_1FullImageCell getCellHeight];
    }
    if (self.homePageModel.type == 1) {
        return 200;
    }
    if (self.homePageModel.type == 2) {
        return 180;
    }
    return height;
}

#pragma mark - Template 2 ShowCollectionViewPage Delegate

-(void)showWebViewPage:(NSString *)titleString withWebUrl:(NSString *)urlString {
    
    WebViewController *tempVC = [[WebViewController alloc] init];
    tempVC.titleString = titleString;
    tempVC.urlString = urlString;
    [self.navigationController pushViewController:tempVC animated:YES];
}

#pragma mark - Template 3 ShowBannerWebViewPageDelegate

-(void)showBannerWebViewPage:(NSString *)titleString withWebUrl:(NSString *)urlString {
    WebViewController *tempVC = [[WebViewController alloc] init];
    tempVC.titleString = titleString;
    tempVC.urlString = urlString;
    [self.navigationController pushViewController:tempVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
