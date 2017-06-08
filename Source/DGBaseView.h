//
//  TSBaseView.h
//  Example
//
//  Created by Dylan Gyesbreghs on 08/06/2017.
//  Copyright © 2017 Dylan Gyesbreghs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
#import "UIView+DGSwitch.h"

typedef NS_ENUM(NSUInteger, DGSwitchState) {
    kDGSwitchStateYes,
    kDGSwitchStateNo,
    kDGSwitchStateUndecided
};

@interface DGBaseView : UIView

@property (nonatomic) DGSwitchState state;

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *noColor;
@property (nonatomic, strong) UIColor *yesColor;
@property (nonatomic, strong) UIColor *selectedColor;

- (void)setupDefaultValues;
- (void)setupView;
- (void)setupConstraints;
- (void)updateView;

@end
