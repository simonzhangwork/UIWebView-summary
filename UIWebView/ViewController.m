//
//  ViewController.m
//  UIWebView
//
//  Created by zhangys on 15/12/18.
//  Copyright © 2015年 zhangys. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1：封装一个网络请求
    NSString * urlString = @"http://www.cnblogs.com/zhangys";//网址是一个字符串
    NSURL * url = [NSURL URLWithString:urlString];//把网址字符串转化为URL
    NSURLRequest * request = [NSURLRequest requestWithURL:url];//把URL封装成一个网络请求
    //2：实例化
    UIWebView * webView = [[UIWebView alloc] initWithFrame:self.view.frame];//像普通视图一样实例化
    //3：加载请求
    [webView loadRequest:request];//webView的加载请求方法，把封装好的请求放进去
    //4：设置代理为当前视图控制器
    webView.delegate = self;
    //5：缩放页面以适应屏幕
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];//UIView中层级关系很重要，不放在父视图上是显示不了的
}


#pragma mark - UIWebViewDelegate

//开始加载数据时调用
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"开始加载数据");
}
//结束加载数据时调用
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"结束加载数据");
}
//加载失败时调用
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"加载失败");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
