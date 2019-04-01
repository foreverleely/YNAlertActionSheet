//
//  YNAlertActionSheet.m
//  YNActionSheetDemo
//
//  Created by liyangly on 2019/4/1.
//  Copyright © 2019 liyang. All rights reserved.
//

#define SHOWTIME 0.3
#define DISSMISSTIME 0.3
#define CORNER 15
#define SHEETHEIGHT 50
#define CANCLEHEIGHT 50
#define TITLEHEIGHT 60
#define SECTIONHEIGHT 5
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)

#import "YNAlertActionSheet.h"

@interface YNAlertActionSheet()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *sheetTable;
@property (nonatomic, assign) YNActionSheetStyle actionsheetStyle;

@end

@implementation YNAlertActionSheet
{
    NSString *_sheetTitle;
    NSString *_cancleTitle;
    NSArray *_subTitleArr;
    UIView *_headerView;
    UILabel *_titleLabel;
    UIButton *_cancleBtn;
    
    CGFloat _tableHeight;
    CGFloat _cellHeight;
    CGFloat _titleHeight;
    CGFloat _cancleHeight;
    NSInteger _cellCount;
}

- (instancetype)initWithTitle:(NSString *)title
                    subTitles:(NSArray *)subTitles
               cancleBtnTitle:(NSString *)cancleBtnTitle
                   sheetStyle:(YNActionSheetStyle)sheetStyle
                     delegate:(id<YNActionSheetDelegate>)delegate {
    
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        
        _isCorner = YES;
        _actionsheetStyle = sheetStyle;
        _sheetTitle = title;
        _cancleTitle = cancleBtnTitle;
        _subTitleArr = subTitles;
        _cellCount = _subTitleArr.count;
        if (delegate) {
            self.delegate = delegate;
        }
    }
    return self;
}

- (void)show {
    
    [self setupView];
    [self setSheetProperty];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    [UIView animateWithDuration:SHOWTIME animations:^{
        self.sheetTable.frame = CGRectMake((ScreenWidth - self->_tableWidth)/2, ScreenHeight - self->_tableHeight, self->_tableWidth, self->_tableHeight);
    }];
}

- (void)setupView {
    
    if (_cellCount == 0) {
        _cellCount = _iconArr.count;
    }
    [UIView animateWithDuration:SHOWTIME animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    }];
    
    _cellHeight = (_subTitleHeight)?_subTitleHeight:SHEETHEIGHT;
    _titleHeight = (_titleHeight)?_titleHeight:TITLEHEIGHT;
    _cancleHeight = (_cancleHeight)?_cancleHeight:CANCLEHEIGHT;
    _tableWidth = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? ((_tableWidth > 0)?_tableWidth:600) : ScreenWidth;
    _tableHeight = (_sheetTitle.length == 0)?(_cellCount*_cellHeight + _cancleHeight + SECTIONHEIGHT):((_cellCount)*_cellHeight + _titleHeight + _cancleHeight + SECTIONHEIGHT*2);
    
    if (_sheetTitle.length != 0) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableWidth, _titleHeight)];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _tableWidth, _titleHeight)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.text = _sheetTitle;
        [_headerView addSubview:_titleLabel];
    }
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableWidth, _cancleHeight)];
    _cancleBtn = [[UIButton alloc] init];
    _cancleBtn.frame = CGRectMake(0, 0, _tableWidth, _cancleHeight);
    [_cancleBtn setTitle:_cancleTitle forState:(UIControlStateNormal)];
    [_cancleBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    _cancleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_cancleBtn setBackgroundColor:[UIColor whiteColor]];
    [_cancleBtn addTarget:self action:@selector(actionSheetCancle:) forControlEvents:(UIControlEventTouchUpInside)];
    [footerView addSubview:_cancleBtn];
    
    self.sheetTable = [[UITableView alloc] init];
    _sheetTable.frame = CGRectMake((ScreenWidth - _tableWidth)/2, ScreenHeight, _tableWidth, _tableHeight);
    _sheetTable.backgroundColor = [UIColor clearColor];
    _sheetTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _sheetTable.delegate = self;
    _sheetTable.dataSource = self;
    _sheetTable.scrollEnabled = NO;
    _sheetTable.tableHeaderView = _headerView;
    _sheetTable.tableFooterView = footerView;
    [self addSubview:_sheetTable];
}

- (void)setSheetProperty {
    
    if (self.titleColor) {
        _titleLabel.textColor = self.titleColor;
    }
    if (self.titleFont) {
        _titleLabel.font = self.titleFont;
    }
    if (self.titleBgColor) {
        _titleLabel.backgroundColor = self.titleBgColor;
    }
    if (self.cancleBgColor) {
        [_cancleBtn setBackgroundColor:self.cancleBgColor];
    }
    if (self.isCorner) {
        _titleLabel.layer.cornerRadius = CORNER;
        _titleLabel.layer.masksToBounds = YES;
        _cancleBtn.layer.cornerRadius = CORNER;
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _cellCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"sheetCell";
    YNAlertActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[YNAlertActionSheetCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    
    switch (_actionsheetStyle) {
        case YNActionSheetDefault:
            [cell setupYNActionSheetDefaultCellWithTitle:_subTitleArr[indexPath.row]   cellWidth:_tableWidth cellHeight:_cellHeight];
            break;
        case YNActionSheetIconAndTitle:
        {
            if (_subTitleArr.count == _iconArr.count && _subTitleArr.count == _cellCount) {
                UIFont *font = _subtitleFont?_subtitleFont:[UIFont systemFontOfSize:17];
                [cell setupYNActionSheetIconAndTitleWithTitle:_subTitleArr[indexPath.row] titleFont:font icon:_iconArr[indexPath.row] cellWidth:_tableWidth cellHeight:_cellHeight];
            }
        }
            break;
        case YNActionSheetIcon:
            if (_iconArr.count == _cellCount) {
                [cell setupYNActionSheetIconAndTitleWithIcon:_iconArr[indexPath.row] cellWidth:_tableWidth cellHeight:_cellHeight];
            }
            break;
        default:
            break;
    }
    
    if (self.subtitleColor) {
        cell.titleLab.textColor = self.subtitleColor;
    }
    if (self.subtitleFont) {
        cell.titleLab.font = self.subtitleFont;
    }
    if (self.subtitleBgColor) {
        cell.coverView.backgroundColor = self.subtitleBgColor;
    }
    if (self.lineColor) {
        cell.bottomLine.backgroundColor = self.lineColor;
    }
    if (self.isCorner) {
        UIBezierPath *maskPath;
        if (indexPath.row == 0) {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.coverView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(CORNER, CORNER)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = cell.bounds;
            maskLayer.path = maskPath.CGPath;
            cell.layer.mask = maskLayer;
        }else if (indexPath.row == _cellCount-1){
            maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.coverView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(CORNER, CORNER)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = cell.bounds;
            maskLayer.path = maskPath.CGPath;
            cell.layer.mask = maskLayer;
        }
        
    }
    if (indexPath.row == _cellCount-1) {
        cell.bottomLine.hidden = YES;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return _cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (_sheetTitle.length != 0) {
        return SECTIONHEIGHT;
    }else{
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableWidth, SECTIONHEIGHT)];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableWidth, SECTIONHEIGHT)];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return SECTIONHEIGHT;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self actionSheet:self clickButtonAtIndex:indexPath.row];
}

#pragma mark - YNActionSheetDelegate
- (void)actionSheet:(YNAlertActionSheet *)actionSheet clickButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([self.delegate respondsToSelector:@selector(actionSheet:clickButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickButtonAtIndex:buttonIndex];
    }
    [self dissmiss];
    
}

- (void)actionSheetCancle:(YNAlertActionSheet *)actionSheet {
    
    if ([self.delegate respondsToSelector:@selector(actionSheetCancle:)]) {
        [self.delegate actionSheetCancle:self];
    }
    [self dissmiss];
}

#pragma mark - dissmiss
- (void)dissmiss {
    
    [UIView animateWithDuration:DISSMISSTIME animations:^{
        self.alpha = 0;
        self.sheetTable.frame = CGRectMake((ScreenWidth - self->_tableWidth)/2, ScreenHeight, self->_tableWidth, self->_tableHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([touch view] != _sheetTable) {
        [self dissmiss];
    }
}

@end
