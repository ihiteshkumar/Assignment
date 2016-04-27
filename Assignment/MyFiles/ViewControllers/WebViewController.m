//
//  WebViewController.m
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleString;// @"webView";
    // Do any additional setup after loading the view from its nib.
//    NSURL *websiteUrl = [NSURL URLWithString:@"http://www.google.com"];
    
        NSURL *websiteUrl = [NSURL URLWithString:self.urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:websiteUrl];
    [self.webView loadRequest:urlRequest];
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
