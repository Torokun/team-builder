//
//  TBLotViewController.h
//  team-builder
//
//  Created by Toro on 2014/03/29.
//  Copyright (c) 2014年 Toro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBNavigationViewController.h"

@interface TBLotViewController : TBNavigationViewController {
    int _headCount;
    int _teamCount;
}

@property (nonatomic) int headCount;
@property (nonatomic) int teamCount;

@end
