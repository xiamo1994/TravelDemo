//
//  WQPersonalViewController.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/18.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQMineViewController.h"
#import <WebKit/WebKit.h>

@interface WQMineViewController ()

@property (nonatomic, strong) WKWebView *webView;

//@property (nonatomic, strong) UIWebView *webView;

@end

@implementation WQMineViewController

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"我的"];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
//    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:self.webView];
//    [self.webView loadRequest:request];
}

@end
