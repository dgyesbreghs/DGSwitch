//
//  TSSwitchStateSubview.h
//  Example
//
//  Created by Dylan Gyesbreghs on 08/06/2017.
//  Copyright © 2017 Dylan Gyesbreghs. All rights reserved.
//

#import "DGBaseView.h"

@class DGSwitchSubview;
@protocol DGSwitchSubviewDelegate <NSObject>

- (void)switchSubview:(DGSwitchSubview *)subView wasTapped:(BOOL)tapped;

@end

@interface DGSwitchSubview : DGBaseView

@property (nonatomic, weak) id<DGSwitchSubviewDelegate>delegate;

@property (nonatomic, strong) NSString *text;

@end
