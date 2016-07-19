//
//  ViewController.m
//  VWProgressHUDDemo
//
//  Created by Vaith on 16/7/15.
//  Copyright (c) 2016 Shenme Studio. All rights reserved.
//


#import "ViewController.h"
#import <VWProgressHUD/VWProgressHUD.h>
#import "ProgressHUD.h"


@interface ViewController ()
@property (strong, nonatomic) NSArray<NSArray<ProgressHUD *> *> *data;
@end

@implementation ViewController

- (void)injected
{
    [self viewDidLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"VMProgressHUD Demo"];
    NSArray *loading = @[
                         [ProgressHUD progressHUDWithName:@"Simple Loading" sel:@selector(show)],
                         [ProgressHUD progressHUDWithName:@"Loading With Tip" sel:@selector(showWithTip)],
                         [ProgressHUD progressHUDWithName:@"Loading With Tip And Sub" sel:@selector(showLoadingWithTipAndSub)],

                         ];
    NSArray *message = @[
            [ProgressHUD progressHUDWithName:@"Show Default Type  Message" sel:@selector(showMsg)],
            [ProgressHUD progressHUDWithName:@"Show Done Message" sel:@selector(showDoneMsg)],
            [ProgressHUD progressHUDWithName:@"Show Fail Message" sel:@selector(showFailMsg)],
            [ProgressHUD progressHUDWithName:@"Show Warning Message" sel:@selector(showWarningMsg)]
    ];
    self.data = @[loading,message];
}

#pragma mark progress hud method
- (void)show
{
    [[VWProgressHUD shareInstance] showLoading];
}

- (void)showWithTip
{
    [[VWProgressHUD shareInstance] showLoadingWithTip:@"Hello World"];
}

- (void)showLoadingWithTipAndSub
{
    [[VWProgressHUD shareInstance] showLoadingWithTip:@"Hello World" sub:@"This is a post method\n1/99"];
}

- (void)showMore
{
    [[VWProgressHUD shareInstance] showLoadingWithTip:@"Hello World,Hello World,Hello World" sub:@"Life is too short to waste. Dreams are fulfilled only through action, not through endless planning to take action."];
}

- (void)showMsg
{
    [[VWProgressHUD shareInstance] showMsg:@"Hello, This's default msg.And This will auto  dismiss "];
}


- (void)showDoneMsg
{
    [[VWProgressHUD shareInstance] showDoneMsg:@"Hello, This's done msg"];
}

- (void)showFailMsg
{
    [[VWProgressHUD shareInstance] showFailMsg:@"Hello, This's fail msg"];
}

- (void)showWarningMsg
{
    [[VWProgressHUD shareInstance] showWarningMsg:@"Hello, This's warning msg"];
}


#pragma mark - TableView Data Source
#pragma mark section number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

#pragma mark row number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data[section].count;
}

#pragma mark cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    [cell.textLabel setText:self.data[indexPath.section][indexPath.row].name];
    return cell;
}

#pragma mark selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SEL sel = self.data[indexPath.section][indexPath.row].sel;
    if ([self respondsToSelector:sel])
    {
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:sel];
    }
}

@end