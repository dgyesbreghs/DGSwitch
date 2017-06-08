//
//  TSHoverView.h
//  Example
//
//  Created by Dylan Gyesbreghs on 08/06/2017.
//  Copyright © 2017 Dylan Gyesbreghs. All rights reserved.
//

#import "DGBaseView.h"

@class DGHoverView;
@protocol DGHoverViewDelegate <NSObject>

- (void)hoverView:(DGHoverView *)subView wasTapped:(BOOL)tapped;

@end

@interface DGHoverView : DGBaseView

@property (nonatomic, weak) id<DGHoverViewDelegate> delegate;

@property (nonatomic, strong) NSString *text;

@end
