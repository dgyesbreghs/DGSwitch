//
//  UIView+TSSwitch.m
//  Example
//
//  Created by Dylan Gyesbreghs on 08/06/2017.
//  Copyright © 2017 Dylan Gyesbreghs. All rights reserved.
//

#import "UIView+DGSwitch.h"

@implementation UIView (DGSwitch)

- (void)roundCorners
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.height / 2;
}

@end
