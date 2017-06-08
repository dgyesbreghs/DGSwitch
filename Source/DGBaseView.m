//
//  TSBaseView.m
//  Example
//
//  Created by Dylan Gyesbreghs on 08/06/2017.
//  Copyright © 2017 Dylan Gyesbreghs. All rights reserved.
//

#import "DGBaseView.h"

@implementation DGBaseView

- (instancetype)init
{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

#pragma mark - Public Methods

- (void)setup
{
    [self setupDefaultValues];
    [self setupView];
    [self setupConstraints];
}

- (void)setupDefaultValues
{
    _borderColor = [UIColor colorWithRed:173.0/255.0 green:185.0/255.0 blue:191.0/255.0 alpha:1];
    _noColor = [UIColor colorWithRed:241.0/255.0 green:101.0/255.0 blue:41.0/255.0 alpha:1];
    _yesColor = [UIColor colorWithRed:27.0/255.0 green:179.0/255.0 blue:47.0/255.0 alpha:1];
    _selectedColor = [UIColor whiteColor];
    _state = kDGSwitchStateUndecided;
}

- (void)setupView
{
    
}

- (void)setupConstraints
{
    
}

- (void)updateView
{
    
}

#pragma mark - Setters

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = [_borderColor CGColor];
}

- (void)setState:(DGSwitchState)state
{
    _state = state;
    [self updateView];
}

@end
