//
//  YNAlertActionSheet.h
//  YNActionSheetDemo
//
//  Created by liyangly on 2019/4/1.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YNAlertActionSheetCell.h"

@class YNAlertActionSheet;

@protocol YNActionSheetDelegate <NSObject>

- (void)actionSheet:(YNAlertActionSheet *)actionSheet clickButtonAtIndex:(NSInteger)buttonIndex;

- (void)actionSheetCancle:(YNAlertActionSheet *)actionSheet;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YNAlertActionSheet : UIView

@property (nonatomic,assign) BOOL isCorner; // default YES

@property (nonatomic,strong) UIColor *titleColor;

@property (nonatomic,strong) UIFont *titleFont;

@property (nonatomic,assign) UIColor *subtitleColor;

@property (nonatomic,strong) UIFont *subtitleFont;

/**
 subtitle part line color
 */
@property (nonatomic,strong) UIColor *lineColor;

@property (nonatomic,strong) UIColor *subtitleBgColor;

@property (nonatomic,strong) UIColor *titleBgColor;

@property (nonatomic,strong) UIColor *cancleBgColor;

@property (nonatomic,assign) CGFloat titleHeight;

@property (nonatomic,assign) CGFloat subTitleHeight;

@property (nonatomic,assign) CGFloat cancleHeight;

@property (nonatomic,assign) CGFloat tableWidth;

/**
 if YNActionSheetIconAndTitle or YNActionSheetIcon, set it
 */
@property (nonatomic,strong) NSMutableArray *iconArr;

@property (nonatomic,weak) id<YNActionSheetDelegate> delegate;



- (instancetype)initWithTitle:(NSString *)title
                    subTitles:(NSArray *)subTitles
               cancleBtnTitle:(NSString *)cancleBtnTitle
                   sheetStyle:(YNActionSheetStyle)sheetStyle
                     delegate:(id<YNActionSheetDelegate>)delegate;

- (void)show;

- (void)dissmiss;

@end

NS_ASSUME_NONNULL_END
