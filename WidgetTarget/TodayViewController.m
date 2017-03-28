//
//  TodayViewController.m
//  WidgetTarget
//
//  Created by YJHou on 2017/3/28.
//  Copyright © 2017年 Houmanager. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <Masonry.h>
#import "UIView+YJSuperExt.h"

#define PREFERRED_COMPACT_CONTENT_HEIGHT 100.0f
#define PREFERRED_EXPANDED_CONTENT_HEIGHT 200.0f

@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic, strong) UIButton *openBtn; /**< 测试打开OpenBtn */

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setUpTodayMainView];
}

- (void)_setUpTodayMainView{
    
    // 1. 设置大小，宽度不能调节设置高度就行
    self.preferredContentSize = CGSizeMake(0, PREFERRED_COMPACT_CONTENT_HEIGHT);
    
    [self.view addSubview:self.openBtn];
    [self.openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.leading.equalTo(self.view).offset(10);
        make.trailing.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(PREFERRED_COMPACT_CONTENT_HEIGHT - 10);
    }];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}

#pragma mark - iOS 10之前祛除左边缘间隙
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return UIEdgeInsetsZero;
}

#pragma mark - 展开和关闭
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{
    if (activeDisplayMode == NCWidgetDisplayModeCompact) { // 收起
        self.preferredContentSize = CGSizeMake(0, PREFERRED_COMPACT_CONTENT_HEIGHT);
    }else if (activeDisplayMode == NCWidgetDisplayModeExpanded){ // 展开
        self.preferredContentSize = CGSizeMake(0, PREFERRED_EXPANDED_CONTENT_HEIGHT);
    }
}

#pragma mark - Lazy
- (UIButton *)openBtn{
    if (!_openBtn) {
        _openBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _openBtn.backgroundColor = [UIColor orangeColor];
        [_openBtn setTitle:@"打开" forState:UIControlStateNormal];
        [_openBtn setTitle:@"打开" forState:UIControlStateHighlighted];
        [_openBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_openBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_openBtn addTarget:self action:@selector(openWidgitClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [_openBtn yj_cornerRadius:5 color:nil borderWidth:0.0f];
    }
    return _openBtn;
}

- (void)openWidgitClickAction:(UIButton *)btn{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
