//
//  TSHoverView.m
//  Example
//
//  Created by Dylan Gyesbreghs on 08/06/2017.
//  Copyright © 2017 Dylan Gyesbreghs. All rights reserved.
//

#import "DGHoverView.h"

@interface DGHoverView()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation DGHoverView

#pragma mark - UIKit Methods

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self roundCorners];
    
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowOpacity = 0.45;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:self.bounds] CGPath];
    self.layer.shadowRadius = 1.0;
}

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

- (void)updateView
{
    if (self.state == kDGSwitchStateNo) {
        self.backgroundColor = self.noColor;
        self.text = @"No";
    } else {
        self.backgroundColor = self.yesColor;
        self.text = @"Yes";
    }
}

- (void)setupAction
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewIsTapped:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGestureRecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewIsMoving:)];
    [self addGestureRecognizer:panGestureRecognizer];
    
    self.userInteractionEnabled = YES;
}

#pragma mark - Getters

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] initForAutoLayout];
        _textLabel.textColor = self.selectedColor;
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
    if (self.delegate && [self.delegate respondsToSelector:@selector(hoverView:wasTapped:)]) {
        [self.delegate hoverView:self wasTapped:YES];
    }
}

- (void)viewIsMoving:(UIPanGestureRecognizer *)sender
{
    [self bringSubviewToFront:sender.view];
    CGPoint translatedPoint = [sender translationInView:sender.view.superview];
    translatedPoint = CGPointMake(sender.view.center.x + translatedPoint.x, sender.view.center.y);
    
    [sender.view setCenter:translatedPoint];
    [sender setTranslation:CGPointZero inView:sender.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        BOOL moveView = NO;
        if (translatedPoint.x > (self.bounds.size.width / 2)) {
            moveView = self.state == kDGSwitchStateNo;
        } else {
            moveView = self.state == kDGSwitchStateYes;
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(hoverView:wasTapped:)]) {
            [self.delegate hoverView:self wasTapped:moveView];
        }
    }
}

@end
