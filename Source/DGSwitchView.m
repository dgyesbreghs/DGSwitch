//
//  ThreeStateSwitch.m
//  Example
//
//  Created by Dylan Gyesbreghs on 08/06/2017.
//  Copyright © 2017 Dylan Gyesbreghs. All rights reserved.
//

#import "DGSwitchView.h"
#import "DGHoverView.h"
#import "DGSwitchSubview.h"

@interface DGSwitchView()<DGSwitchSubviewDelegate, DGHoverViewDelegate>

@property (nonatomic, strong) UIView *seperatorLine;
@property (nonatomic, strong) DGSwitchSubview *noSubview;
@property (nonatomic, strong) DGSwitchSubview *yesSubview;
@property (nonatomic, strong) DGHoverView *hoverView;

@property (nonatomic, strong) NSLayoutConstraint *noConstraint;
@property (nonatomic, strong) NSLayoutConstraint *yesConstraint;

@end

@implementation DGSwitchView

#pragma mark - UIKit Methods

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self roundCorners];
}

#pragma mark - Helper Methods

- (void)setupView
{
    [super setupView];
    [self addSubview:self.seperatorLine];
    [self addSubview:self.noSubview];
    [self addSubview:self.yesSubview];
    [self addSubview:self.hoverView];
    
    self.layer.borderColor = [self.borderColor CGColor];
    self.layer.borderWidth = 1;
}

- (void)setupConstraints
{
    [super setupConstraints];
    [self setupSeperatorLineConstraints];
    [self setupNoSubviewConstraints];
    [self setupYesSubviewConstraints];
    [self setupHoverViewContraints];
}

- (void)setupSeperatorLineConstraints
{
    [self.seperatorLine autoSetDimension:ALDimensionWidth toSize:1];
    [self.seperatorLine autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [self.seperatorLine autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [self.seperatorLine autoCenterInSuperview];
}

- (void)setupNoSubviewConstraints
{
    [self.noSubview autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeRight];
    [self.noSubview autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.seperatorLine];
}

- (void)setupYesSubviewConstraints
{
    [self.yesSubview autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeLeft];
    [self.yesSubview autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.seperatorLine];
}

- (void)setupHoverViewContraints
{
    [self.hoverView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [self.hoverView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    
    // Otherwise the AutoLayout engine is unhappy 😢
    [NSLayoutConstraint autoSetPriority:UILayoutPriorityDefaultHigh forConstraints:^{
        [self.hoverView autoSetDimension:ALDimensionWidth toSize:(self.frame.size.width * 0.55)];
    }];
    
    self.noConstraint = [self.hoverView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
    
    self.yesConstraint = [self.hoverView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
    self.yesConstraint.active = (self.state == kDGSwitchStateYes);
}

- (void)updateView
{
    self.hoverView.hidden = (self.state == kDGSwitchStateUndecided);
    self.yesConstraint.active = (self.state == kDGSwitchStateYes);
    self.noConstraint.active = (self.state == kDGSwitchStateNo);
    
    __weak typeof(self) welf = self;
    [UIView animateWithDuration:0.25 animations:^{
        welf.hoverView.state = welf.state;
        [welf layoutSubviews];
    }];
}

#pragma mark - Getters

- (UIView *)seperatorLine
{
    if (!_seperatorLine) {
        _seperatorLine = [UIView newAutoLayoutView];
        _seperatorLine.backgroundColor = self.borderColor;
    }
    return _seperatorLine;
}

- (DGSwitchSubview *)noSubview
{
    if (!_noSubview) {
        _noSubview = [[DGSwitchSubview alloc] initForAutoLayout];
        _noSubview.text = @"No";
        _noSubview.delegate = self;
    }
    return _noSubview;
}

- (DGSwitchSubview *)yesSubview
{
    if (!_yesSubview) {
        _yesSubview = [[DGSwitchSubview alloc] initForAutoLayout];
        _yesSubview.text = @"Yes";
        _yesSubview.delegate = self;
    }
    return _yesSubview;
}

- (DGHoverView *)hoverView
{
    if (!_hoverView) {
        _hoverView = [DGHoverView newAutoLayoutView];
        _hoverView.backgroundColor = self.state == kDGSwitchStateYes ? self.yesColor : self.noColor;
        _hoverView.hidden = self.state == kDGSwitchStateUndecided;
        _hoverView.delegate = self;
    }
    return _hoverView;
}

#pragma mark - Setters

- (void)setBorderColor:(UIColor *)borderColor
{
    [super setBorderColor:borderColor];
    self.seperatorLine.backgroundColor = borderColor;
}

- (void)setState:(DGSwitchState)state
{
    [super setState:state];
    if (self.delegate && [self.delegate respondsToSelector:@selector(tsSwitch:stateChanged:)]) {
        [self.delegate tsSwitch:self stateChanged:state];
    }
}

#pragma mark - TSSwitchSubviewDelegate

- (void)switchSubview:(DGSwitchSubview *)subView wasTapped:(BOOL)tapped
{
    if ([self.noSubview isEqual:subView]) {
        self.state = kDGSwitchStateNo;
    } else if ([self.yesSubview isEqual:subView]) {
        self.state = kDGSwitchStateYes;
    }
}

#pragma mark - TSHoverViewDelegate

- (void)hoverView:(DGHoverView *)subView wasTapped:(BOOL)tapped
{
    if (self.state == kDGSwitchStateYes) {
        self.state = kDGSwitchStateNo;
    } else {
        self.state = kDGSwitchStateYes;
    }
}

@end
