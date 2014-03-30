//
//  TBNavigationViewController.m
//  team-builder
//
//  Created by Toro on 2014/03/29.
//  Copyright (c) 2014年 Toro. All rights reserved.
//

#import "TBNavigationViewController.h"
#import "UIIntColor.h"

@interface TBNavigationViewController ()

@end

@implementation TBNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // ナビゲーションバー
    //self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barTintColor = [UIIntColor colorWithRed:67 green:120 blue:182 alpha:255];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIIntColor colorWithRed:234 green:234 blue:234 alpha:255]};
    
    // View
    self.view.backgroundColor = [UIIntColor colorWithRed:98 green:98 blue:159 alpha:255];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
