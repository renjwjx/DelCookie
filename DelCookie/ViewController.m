//
//  ViewController.m
//  DelCookie
//
//  Created by jinren on 3/2/15.
//  Copyright (c) 2015 imp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, 320, 400)];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
    
}
- (IBAction)delCookieButton:(id)sender {
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
         NSLog(@"--------------del cookie start-----------------------");
    for (NSHTTPCookie *cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
     NSLog(@"--------------del cookie end-----------------------");
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (IBAction)printCookieButton:(id)sender {
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        NSLog(@"-------------print cookie start-----------------------");
    for (NSHTTPCookie *cookie in [storage cookies]) {
        NSLog(@"cookie:%@",[cookie description]);
    }
    NSLog(@"-------------print cookie end-----------------------");
}
- (IBAction)refreshWebView:(id)sender {
//    [webView reload];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
