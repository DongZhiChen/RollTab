//
//  V_ RollingTab.m
//  TCM
//
//  Created by ceing on 16/6/17.
//  Copyright © 2016年 tcm. All rights reserved.
//

#import "V_RollingTab.h"

#define titleW 24

@implementation V_RollingTab


-(id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]){
    
        [self initSet];
    
    }
    
    
    return self;
    
}

-(void)initSet{

    self.clipsToBounds = YES;
    _titleFont = [UIFont systemFontOfSize:13];
    _normalColor = [UIColor whiteColor];
    _selectedColor = [UIColor blackColor];
    _isCanRoll = NO;
    _isAddIndexLine = NO;
    _selectedIndex = 0;
  
    
    self.layer.borderColor = [UIColor colorWithRed:43.0/255 green:43.0/255 blue:43.0/255 alpha:1].CGColor;
    self.layer.borderWidth = 0.8;
    self.layerLineType = LayerLineTypeTop | LayerLineTypeBottom;
    
}

-(void)setArrayTitles:(NSArray *)arrayTitles{
    
    float width = CGRectGetWidth(self.bounds)/arrayTitles.count;
    
    for (int i = 0; i < arrayTitles.count; i++){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.tag = 100+i;
        btn.frame = CGRectMake(width*i, 0, width, CGRectGetHeight(self.bounds));
        btn.titleLabel.font = _titleFont;
        [btn setTitleColor:_normalColor forState:UIControlStateNormal];
        [btn setTitle:arrayTitles[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        
        if(i > 0){
            
            btn.layer.borderColor = [UIColor blackColor].CGColor;
            btn.layer.borderWidth = 1;
            
            btn.layerHeight = btn.frame.size.height/2;
            btn.layerLineType = LayerLineTypeLeft;
            
        }

        
        [self addSubview:btn];
        
    }
}

-(void)setRollingColorWithTabTileColor:(UIColor *)tabTileColor AddSelectedColor:(UIColor *)selectedColor AddLineColor:(UIColor *)lineColor AddTitleFont:(UIFont *)font{

    self.lineColor = lineColor;
    self.tabTitleColor = tabTileColor;
    self.tabSelectedTitleColor = selectedColor;
    self.font = font;
}


#pragma mark - createTab -


-(void)createRollingTabIsNeedRolling:(BOOL)isRolling AddIsNeedLine:(BOOL)isNeedLine AddTabTitleSize:(CGSize)tabTitleSize AddTitles:(NSArray *)arrayTitles {
    
    [self createRollingTabIsNeedRolling:isRolling AddIsNeedLine:isNeedLine AddTabTitleSize:tabTitleSize AddTitles:arrayTitles AddSelectdIndex:0];
    
}


-(void)createRollingTabIsNeedRolling:(BOOL)isRolling AddIsNeedLine:(BOOL)isNeedLine AddTabTitleSize:(CGSize)tabTitleSize AddTitles:(NSArray *)arrayTitles AddSelectdIndex:(int)index{
    
    [self createRollingTabIsNeedRolling:isRolling AddIsNeedLine:isNeedLine AddTabTitleSize:tabTitleSize AddTitles:arrayTitles AddSelectdIndex:index AddIsDrawrRulesLine:NO];
    }



-(void)createRollingTabIsNeedRolling:(BOOL)isRolling AddIsNeedLine:(BOOL)isNeedLine AddTabTitleSize:(CGSize)tabTitleSize AddTitles:(NSArray *)arrayTitles AddSelectdIndex:(int)index AddIsDrawrRulesLine:(BOOL)isDrawRulerLine{

    
    if ( !isRolling ){
        
        CGSize size = CGSizeMake(self.frame.size.width/arrayTitles.count, self.frame.size.height);
        
        
        for (int i = 0; i < arrayTitles.count; i++){
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = 100+i;
            btn.frame = CGRectMake(size.width*i, 0, size.width, size.height);
            
            [btn setTitleColor:self.tabTitleColor ? self.tabTitleColor :[UIColor grayColor] forState:UIControlStateNormal];
            
            btn.titleLabel.font = self.font ? self.font : [UIFont systemFontOfSize:14];
            [btn setTitle:arrayTitles[i] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
            
            if (isNeedLine){
                
                [btn setTitleColor:self.tabSelectedTitleColor ? self.tabSelectedTitleColor :[UIColor orangeColor] forState:UIControlStateSelected];
                
                if (i == index){
                    
                    btn.selected = YES;
                    self.selectedBtn = btn;
                    
                }
                
            }
            
           
            if(isDrawRulerLine){
            
    
                if(i > 0){
                    
                    btn.layer.borderColor = [UIColor blackColor].CGColor;
                    btn.layer.borderWidth = 1;
                    
                    btn.layerHeight = btn.frame.size.height/2;
                    btn.layerLineType = LayerLineTypeLeft;
                
                }
               
            }
        }
        
        
    }
    
    
    if (isNeedLine){
        
        
        CGRect lineFrame ;
        
        lineFrame.origin.x = (self.frame.size.width/arrayTitles.count - titleW)/2.0+index * self.frame.size.width/arrayTitles.count;
        lineFrame.origin.y = self.frame.size.height-2;
        lineFrame.size.width = titleW;
        lineFrame.size.height = 1;
        
        self.line = [[UIView alloc] initWithFrame:lineFrame];
        
        self.line.backgroundColor = self.lineColor ? self.lineColor : [UIColor orangeColor];
        [self addSubview:self.line];
        
        
    }
    

    
}



#pragma mark -

///修改颜色
-(void)setTabTileColor:(UIColor *)tabTileColor AddSelectedTitleColor:(UIColor *)selectedTitleColor AddLineColor:(UIColor *)lineColor AddTabCount:(int)count{

    if ( [self viewWithTag:100] ){
    
        self.line.backgroundColor = lineColor;
        
        for (int i = 0; i < count; i++){
           
            UIButton *btn = [self viewWithTag:100+i];
            
            [btn setTitleColor:tabTileColor forState:UIControlStateNormal];
            [btn setTitleColor:selectedTitleColor forState:UIControlStateSelected];
            
        }
        
    }
    
}

-(void)setSelectedIndex:(int)index{

    UIButton *btn = [self viewWithTag:100+index];
    
    [self selectedTab:btn];
    
}

#pragma mark - UIButtonEventClick -

-(void)selectedTab:(UIButton *)sender{


    if ( self.line ){
    
        if ( !sender.isSelected ){
            
            sender.selected = YES;
            self.selectedBtn.selected = NO;
            self.selectedBtn = sender;
            
            
            CGRect frame = self.line.frame;
            frame.origin.x = sender.frame.origin.x+(sender.frame.size.width - titleW)/2.0;
//            [UIView animateWithDuration:0.3 animations:^(){
//                
//                self.line.frame =  frame;
//                
//            }];
          
            
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                 self.line.frame =  frame;
                
            } completion:^(BOOL finished) {
                
            }];
            
            
             [self.delegate V_RollingTabSelectedIndx:(int)(sender.tag-100) AddTag:self.tag];
            
        }

    }else{
    
     [self.delegate V_RollingTabSelectedIndx:(int)(sender.tag-100) AddTag:self.tag];
        
    }
    
    
}



@end
