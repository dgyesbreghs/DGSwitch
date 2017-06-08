//
//  ThreeStateSwitch.h
//  Example
//
//  Created by Dylan Gyesbreghs on 08/06/2017.
//  Copyright © 2017 Dylan Gyesbreghs. All rights reserved.
//

#import "DGBaseView.h"

@class DGSwitchView;
@protocol DGSwitchDelegate <NSObject>

- (void)tsSwitch:(DGSwitchView *)tsSwitch stateChanged:(DGSwitchState)state;

@end

@interface DGSwitchView : DGBaseView

@property (nonatomic, weak) id<DGSwitchDelegate> delegate;

@end
