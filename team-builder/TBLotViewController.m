//
//  TBLotViewController.m
//  team-builder
//
//  Created by Toro on 2014/03/29.
//  Copyright (c) 2014年 Toro. All rights reserved.
//

#import "TBLotViewController.h"
#import "UIIntColor.h"

@interface TBLotViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamLabel;

@end

@implementation TBLotViewController

@synthesize headCount = _headCount;
@synthesize teamCount = _teamCount;


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
    // 渡された値を暫定的にログに出す
    NSLog(@"%d", _headCount);
    NSLog(@"%d", _teamCount);
    NSArray *teamDividedArray = [self lot];
    NSLog(@"チーム分け結果");
    for(int i = 0; i < _headCount; i++) {
        NSLog(@"%d : %d", i, [teamDividedArray[i] integerValue]);
    }
    self.title = @"抽選結果";
    _tipsLabel.text = @"画面をタップするとチームが分かるよ";
    _tipsLabel.textColor = [UIIntColor colorWithRed:0 green:0 blue:0 alpha:255];
    _tipsLabel.backgroundColor = [UIIntColor colorWithRed:255 green:255 blue:255 alpha:255];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSArray *) lot
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:_headCount];
    NSMutableArray *teamMaxMemberCountArray = [NSMutableArray arrayWithCapacity:_teamCount];
    NSMutableArray *currentTeamMemberCountArray = [NSMutableArray arrayWithCapacity:_teamCount];
    int max = ceil((double)_headCount / _teamCount);
    int maxCount = _headCount % _teamCount;
    // どのチームに何人入れるか
    for(int i = 0; i < _teamCount; i++) {
        if(maxCount == 0 || i < maxCount) {
            teamMaxMemberCountArray[i] = [NSNumber numberWithInt:max];
        } else {
            teamMaxMemberCountArray[i] = [NSNumber numberWithInt:(max - 1)];
        }
        currentTeamMemberCountArray[i] = [NSNumber numberWithInt:0];
    }
    // ランダムで抽選
    for(int i = 0; i < _headCount; i++) {
        int tempTeamNum = arc4random_uniform(_teamCount);
        int currtntTeamNum = 0;
        for(int j = 0; j <= tempTeamNum; j++) {
            // 所属できるチームに順番に回す
            int teamMember = [currentTeamMemberCountArray[currtntTeamNum] integerValue];
            int teamMax = [teamMaxMemberCountArray[currtntTeamNum] integerValue];
            if(teamMember >= teamMax) {
                // 候補から外れるためループ回数を増やす
                j--;
            }
            currtntTeamNum++;
            if(currtntTeamNum >= _teamCount) {
                currtntTeamNum = 0;
            }
        }
        // 所属チームは最終のインクリメントの1つ前のチーム
        if(currtntTeamNum == 0) {
            currtntTeamNum = _teamCount - 1;
        } else {
            currtntTeamNum--;
        }
        // 入るチーム番号が決定したので覚える
        result[i] = [NSNumber numberWithInt:currtntTeamNum];
        // 入ったチームのメンバー数を増やす
        int teamCurrent = [currentTeamMemberCountArray[currtntTeamNum] integerValue];
        currentTeamMemberCountArray[currtntTeamNum] = [NSNumber numberWithInt:(teamCurrent + 1)];
    }
    return result;
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
