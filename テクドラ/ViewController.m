//
//  ViewController.m
//  テクドラ
//
//  Created by Master on 13/03/15.
//  Copyright (c) 2013年 com.litech. All rights reserved.
//

#import "ViewController.h"
#import "UIView+shake.h"
#import "UIImageView+effects.h"
#import "UIImage+fill.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    hp = 100;
    hpLabel.text = [NSString stringWithFormat:@"%d",hp];
    

    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - きあいだめ
/*
 *
 * 問題1 画面上の「こうげきりょく」数字が3ずつ増えていくボタンを作ろう。
 * 問題2 数字が10以上30未満ならば文字の色が緑に、30以上50未満ならば青、50以上ならば赤になるコードを、if文を使って問題1の関数の中に加えてみよう。
 * 問題3 問題2の条件分岐コードをswitch文で書き換えてみよう。
 *
 */

-(IBAction)powerup{
    power  = power + 3;
    powerLabel.text = [NSString stringWithFormat:@"%d",power];
}



-(IBAction)colorchange{
    if (9 < power &&  power < 30) {
        color1Label.textColor = [UIColor greenColor];
    }
    else if(31 < power && power < 50){
        color2Label.textColor = [UIColor blueColor];
    }
    color3Label.textColor = [UIColor redColor];
}


#pragma mark - こうげき
/*
 *
 * 問題4 攻撃ボタンを作って、押すと相手にダメージを与えるボタンを作ってみよう。
 * 問題5 「damageAnimation」メソッドを呼び出すメッセージ式を書き加えてみよう。
 * 問題6 相手の体力が0以下になったときに「clear」メソッドを1秒後に呼び出すメッセージ式を書き加えてみよう。
 *
 */

-(IBAction)attack{
    hp = hp - power;
    hpLabel.text = [NSString stringWithFormat:@"%d",hp];
    [self damageAnimation];
    
    if (hp <=  0){
        [self performSelector:@selector(clear)withObject:nil afterDelay:0.1];
    }
}

#pragma mark - はじめから
/*
 *
 *問題7 はじめからやり直す「リトライボタン」を作って、最初の状態に戻してみよう。
 *
 */



-(IBAction)retry{
    self.charaImgView.alpha = 0;
    hp = 100;
    hpLabel.text = [NSString stringWithFormat:@"%d",hp];
    power = 0;
    powerLabel.text = [NSString stringWithFormat:@"%d",power];
}









#pragma mark - 初期設定

/* ----- 攻撃アニメーション ----- */

- (void)damageAnimation{
    DamageAnimationType type;
    type = DamageAnimationType3;
    if (power > 0) {
        self.damageLabel.text = [NSString stringWithFormat:@"%d",power];
    }else{
        self.damageLabel.text = @"miss";
    }
    
    self.damageLabel.textColor = [UIColor whiteColor];
    
    [self.charaImgView shakeWithCount:10 interval:0.03];
    [self.charaImgView whiteFadeInWithDuration:0.3
                                         delay:0.0
                                         block:^(void) {
                                             [self.damageLabel startAnimationWithAnimationType:type];
                                         }];
}



/* ----- フェードアウトアニメーション ----- */
- (void)clear{
    [UIView animateWithDuration:2.0
                     animations:^{
                         self.charaImgView.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         //[self.charaImgView removeFromSuperview];
                         //self.charaImgView.image = nil;
                     }];
}


@end
