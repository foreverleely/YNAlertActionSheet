//
//  YNAlertActionSheetCell.h
//  YNActionSheetDemo
//
//  Created by liyangly on 2019/4/1.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,YNActionSheetStyle){
    
    YNActionSheetDefault,
    YNActionSheetIconAndTitle,
    YNActionSheetIcon
};

@interface YNAlertActionSheetCell : UITableViewCell

@property(nonatomic, strong) UILabel *titleLab;
@property(nonatomic, strong) UIImageView *iconImg;
@property(nonatomic, strong) UIView *bottomLine;
@property(nonatomic, strong) UIView *coverView;


- (void)setupYNActionSheetDefaultCellWithTitle:(NSString *)title
                                     cellWidth:(CGFloat)width
                                    cellHeight:(CGFloat)height;


- (void)setupYNActionSheetIconAndTitleWithTitle:(NSString *)title
                                      titleFont:(UIFont *)font
                                       iconName:(NSString *)iconName
                                      cellWidth:(CGFloat)width
                                     cellHeight:(CGFloat)height;


- (void)setupYNActionSheetIconAndTitleWithIconName:(NSString *)iconName
                                         cellWidth:(CGFloat)width
                                        cellHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
