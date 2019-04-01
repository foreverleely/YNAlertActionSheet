//
//  YNAlertActionSheetCell.m
//  YNActionSheetDemo
//
//  Created by liyangly on 2019/4/1.
//  Copyright © 2019 liyang. All rights reserved.
//

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)

#import "YNAlertActionSheetCell.h"

@implementation YNAlertActionSheetCell
{
    CGFloat _height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.coverView = [[UIView alloc] init];
        [self addSubview:_coverView];
    }
    return self;
}

- (void)setupYNActionSheetDefaultCellWithTitle:(NSString *)title
                                     cellWidth:(CGFloat)width
                                    cellHeight:(CGFloat)height {
    
    _height = height;
    _coverView.frame = CGRectMake(0, 0, width, _height);
    
    self.titleLab = [[UILabel alloc] init];
    _titleLab.frame = CGRectMake(0, 0, width, _height);
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.text = title;
    [self.coverView addSubview:_titleLab];
    
    self.bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, _height-0.5, width, 0.5)];
    _bottomLine.backgroundColor = [UIColor grayColor];
    [self.coverView addSubview:_bottomLine];
    
}
- (void)setupYNActionSheetIconAndTitleWithTitle:(NSString *)title
                                      titleFont:(UIFont *)font
                                       iconName:(NSString *)iconName
                                      cellWidth:(CGFloat)width
                                     cellHeight:(CGFloat)height {
    
    _height = height;
    _coverView.frame = CGRectMake(0, 0, width, _height);
    
    NSDictionary *attrs = @{NSFontAttributeName:font};
    CGSize size = [title sizeWithAttributes:attrs];
    CGFloat titleWidth = size.width+10;
    
    self.titleLab = [[UILabel alloc] init];
    _titleLab.frame = CGRectMake((width-titleWidth)/2, 0, titleWidth, _height);
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.text = title;
    [self.coverView addSubview:_titleLab];
    
    CGFloat iconWidth = _height*0.4;
    self.iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_titleLab.frame)-iconWidth-10, _height*0.3, iconWidth, iconWidth)];
    _iconImg.image = [UIImage imageNamed:iconName];
    [self.coverView addSubview:_iconImg];
    
    self.bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, _height-0.5, width, 0.5)];
    _bottomLine.backgroundColor = [UIColor grayColor];
    [self.coverView addSubview:_bottomLine];
    
}

- (void)setupYNActionSheetIconAndTitleWithIconName:(NSString *)iconName
                                         cellWidth:(CGFloat)width
                                        cellHeight:(CGFloat)height {
    
    _height = height;
    _coverView.frame = CGRectMake(0, 0, width, _height);
    
    CGFloat iconWidth = _height*0.4;
    
    self.iconImg = [[UIImageView alloc] initWithFrame:CGRectMake((width-iconWidth)/2, _height*0.3, iconWidth, iconWidth)];
    _iconImg.image = [UIImage imageNamed:iconName];
    [self.coverView addSubview:_iconImg];
    
    self.bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, _height-0.5, width, 0.5)];
    _bottomLine.backgroundColor = [UIColor grayColor];
    [self.coverView addSubview:_bottomLine];
}

@end
