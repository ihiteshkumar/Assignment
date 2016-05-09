//
//  WebViewController.m
//  Assignment
//
//  Created by Hitesh Kumar on 27/04/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController() <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleString;
    self.webView.delegate = self;
    self.webView.userInteractionEnabled = NO;
    [self loadURL];
}
-(void)loadURL {
    [self showIndicator];
    NSURL *websiteUrl = [NSURL URLWithString:self.urlString];    
    if (websiteUrl) {
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:websiteUrl];
        [self.webView setScalesPageToFit:YES];
        [self.webView loadRequest:urlRequest];
    }
    else{
        [self showAlert];
    }
}
-(void)showIndicator {
    UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    activityView.center = CGPointMake(screenWidth / 2.0, 370.0);
    [activityView startAnimating];
    activityView.tag = 100;
    [self.view addSubview:activityView];
}
-(void)showAlert {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"This page is not available"
                                  message:@""
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"GO BACK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self.navigationController popViewControllerAnimated:self.webView];
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}
#pragma webViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.view viewWithTag:100].hidden = YES;
    self.webView.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
