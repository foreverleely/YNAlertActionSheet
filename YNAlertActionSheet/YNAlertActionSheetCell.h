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
                                    CellHeight:(CGFloat)height;


- (void)setupYNActionSheetIconAndTitleWithTitle:(NSString *)title
                                      titleFont:(UIFont *)font
                                           icon:(UIImage *)icon
                                     cellHeight:(CGFloat)height;


- (void)setupYNActionSheetIconAndTitleWithIcon:(UIImage *)icon
                                    cellHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
