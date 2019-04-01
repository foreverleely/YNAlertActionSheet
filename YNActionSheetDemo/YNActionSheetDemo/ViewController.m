//
//  ViewController.m
//  YNActionSheetDemo
//
//  Created by liyangly on 2019/4/1.
//  Copyright © 2019 liyang. All rights reserved.
//

#import "ViewController.h"
#import "YNAlertActionSheet.h"

@interface ViewController ()<YNActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, 100, 100, 50);
    [btn setTitle:@"ActionSheet" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn addTarget:self action:@selector(actionSheetAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionSheetAction{
    
    // WHActionSheetDefault
    //    WHActionSheet *actionSheet = [[WHActionSheet alloc] initWithTitle:@"默认样式" sheetTitles:@[@"sheet1",@"sheet2",@"sheet3"] cancleBtnTitle:@"取消" sheetStyle:(WHActionSheetDefault) delegate:nil];
    
    // YNActionSheetIconAndTitle
    YNAlertActionSheet *actionSheet = [[YNAlertActionSheet alloc] initWithTitle:@"icon+title" subTitles:@[@"1111111",@"2222222",@"3333333333"] cancleBtnTitle:@"Cancel" sheetStyle:(YNActionSheetIconAndTitle) delegate:self];
    
    // WHActionSheetIcon
    //    WHActionSheet *actionSheet = [[WHActionSheet alloc] initWithTitle:@"图标" sheetTitles:nil cancleBtnTitle:@"取消" sheetStyle:(WHActionSheetIcon) delegate:nil];
    
    
//    actionSheet.isCorner = YES;
//    actionSheet.titleColor = [UIColor greenColor];
//    actionSheet.titleHeight = 100;
//    actionSheet.titleBgColor = [UIColor yellowColor];
//    actionSheet.subtitleBgColor = [UIColor cyanColor];
    actionSheet.subTitleColor = (UIColor *)[UIColor colorWithRed:21/255.0 green:126/255.0 blue:251/255.0 alpha:1.0];
//    actionSheet.subTitleColor = [UIColor blackColor];
//    actionSheet.cancleBgColor = [UIColor greenColor];
//    actionSheet.cancleHeight = 80;
//    actionSheet.tableWidth = 400;
    
    actionSheet.iconNameArr = @[@"test01", @"test02", @"test03"];
    
    
    [actionSheet show];
    
}

#pragma mark - YNActionSheetDelegate

- (void)actionSheet:(YNAlertActionSheet *)actionSheet clickButtonAtIndex:(NSInteger)buttonIndex{
    
}

- (void)actionSheetCancle:(YNAlertActionSheet *)actionSheet{
    
}


@end
