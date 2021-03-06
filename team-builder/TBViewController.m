//
//  TBViewController.m
//  team-builder
//
//  Created by Toro on 2014/03/27.
//  Copyright (c) 2014年 Toro. All rights reserved.
//

#import "TBViewController.h"

@interface TBViewController ()
@property (weak, nonatomic) IBOutlet UITextField *headCountField;
@property (weak, nonatomic) IBOutlet UITextField *teamCountField;
@property (weak, nonatomic) IBOutlet UILabel *headCountErrorLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamCountErrorLabel;
- (IBAction)divTeam:(UIButton *)sender;
- (IBAction)backgroundTouched:(id)sender;


@end

@implementation TBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)divTeam:(UIButton *)sender {
    int headCount = [_headCountField.text intValue];
    int teamCount = [_teamCountField.text intValue];
    
    // キーボードを隠す
    [self.view endEditing:YES];
    
    // エラーメッセージを一旦クリア
    _headCountErrorLabel.text = @"";
    _teamCountErrorLabel.text = @"";
    
    if(headCount < 1) {
        // エラーメッセージを出す
        _headCountErrorLabel.text = @"人数は1人以上にしてね。";
        return;
    } else if(teamCount < 1 || teamCount > 8){
        // エラーメッセージを出す
        _teamCountErrorLabel.text = @"チーム数は1チーム以上、\n8チーム以下にしてね。";
        return;
    } else if(headCount < teamCount) {
        // エラーメッセージを出す
        _teamCountErrorLabel.text = @"人数以上のチームに分けることはできないよ。";
        return;
    }
    // 次の画面へ移動する
    [self performSegueWithIdentifier:@"divSegue" sender:self];
}

// 画面タップでキーボードを隠す
- (IBAction)backgroundTouched:(id)sender {
    [self.view endEditing:YES];
}

// 画面遷移前に呼ばれる
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"divSegue"]) {
        // データを渡す
        TBLotViewController *viewCon = segue.destinationViewController;
        int headCount = [_headCountField.text intValue];
        int teamCount = [_teamCountField.text intValue];
        viewCon.headCount = headCount;
        viewCon.teamCount = teamCount;
        
        // 遷移後の画面の戻るためのボタンのキャプションを変更する
        UIBarButtonItem *backBarButtonItem= [[UIBarButtonItem alloc] initWithTitle:@"戻る" style:UIBarButtonItemStylePlain target:nil action:nil];
        [self.navigationItem setBackBarButtonItem:backBarButtonItem];
    }
}

// 入力文字数を制限する
- (BOOL) textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 変更前のテキストを取得
    NSMutableString *tmp = [_teamCountField.text mutableCopy];
    // 変更後のテキストを取得
    [tmp replaceCharactersInRange:range withString:string];
    // 1文字以内であればYESを返す
    return [tmp length] <= 1;
}
@end
