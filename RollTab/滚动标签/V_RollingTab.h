//
//  V_ RollingTab.h
//  TCM
//
//  Created by ceing on 16/6/17.
//  Copyright © 2016年 tcm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LayerLine.h"


@protocol V_RollingTabDelegate <NSObject>

///点击按钮回调
-(void)V_RollingTabSelectedIndx:(int)index AddTag:(int)tag;

@end



@interface V_RollingTab : UIView


@property (nonatomic,retain) NSArray *arrayTitles;

@property (nonatomic,assign) BOOL isAddIndexLine;

@property (nonatomic,assign) BOOL isCanRoll;

@property (nonatomic,assign) int selectedIndex;

@property (nonatomic,retain) UIColor *selectedColor;

@property (nonatomic,retain) UIColor *normalColor;

@property (nonatomic,retain) UIFont *titleFont;

@property (nonatomic,assign) CGFloat titleWith;







@property (nonatomic,retain) UIButton *selectedBtn;

@property (nonatomic,retain) UIColor *tabTitleColor;
@property (nonatomic,retain) UIColor *tabSelectedTitleColor;
@property (nonatomic,retain) UIColor *lineColor;
@property (nonatomic,retain) UIFont *font;

@property (nonatomic,assign) id <V_RollingTabDelegate> delegate;

@property (nonatomic,retain) UIScrollView *SV_Tab;

@property (nonatomic,assign) CGSize tabTitleSize;

@property (nonatomic,retain)  UIView *line;


-(void)createRollingTabIsNeedRolling:(BOOL)isRolling AddIsNeedLine:(BOOL)isNeedLine AddTabTitleSize:(CGSize)tabTitleSize AddTitles:(NSArray *)arrayTitles;

-(void)setTabTileColor:(UIColor *)tabTileColor AddSelectedTitleColor:(UIColor *)selectedTitleColor AddLineColor:(UIColor *)lineColor AddTabCount:(int)count;


-(void)setRollingColorWithTabTileColor:(UIColor *)tabTileColor AddSelectedColor:(UIColor *)selectedColor AddLineColor:(UIColor *)lineColor AddTitleFont:(UIFont *)font;


///带被选index
-(void)createRollingTabIsNeedRolling:(BOOL)isRolling AddIsNeedLine:(BOOL)isNeedLine AddTabTitleSize:(CGSize)tabTitleSize AddTitles:(NSArray *)arrayTitles AddSelectdIndex:(int)index;


///带被选index ,按钮间有分割线
-(void)createRollingTabIsNeedRolling:(BOOL)isRolling AddIsNeedLine:(BOOL)isNeedLine AddTabTitleSize:(CGSize)tabTitleSize AddTitles:(NSArray *)arrayTitles AddSelectdIndex:(int)index AddIsDrawrRulesLine:(BOOL)isDrawRulerLine;


@end

