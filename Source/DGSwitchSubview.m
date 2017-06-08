//
//  TSSwitchStateSubview.m
//  Example
//
//  Created by Dylan Gyesbreghs on 08/06/2017.
//  Copyright © 2017 Dylan Gyesbreghs. All rights reserved.
//

#import "DGSwitchSubview.h"

@interface DGSwitchSubview()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation DGSwitchSubview

#pragma mark - Helper Methods

- (void)setupView
{
    [self addSubview:self.textLabel];
    [self setupAction];
}

- (void)setupConstraints
{
    [self.textLabel autoCenterInSuperview];
}

- (void)setupAction
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewIsTapped:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGestureRecognizer];
    self.userInteractionEnabled = YES;
}

#pragma mark - Getters

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] initForAutoLayout];
        _textLabel.textColor = self.borderColor;
    }
    return _textLabel;
}

#pragma mark - Setters

- (void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.text = _text;
}

#pragma mark - Actions

- (void)viewIsTapped:(UIGestureRecognizer *)gesture
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(switchSubview:wasTapped:)]) {
        [self.delegate switchSubview:self wasTapped:YES];
    }
}

@end
