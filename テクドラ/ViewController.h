//
//  ViewController.h
//  テクドラ
//
//  Created by Master on 13/03/15.
//  Copyright (c) 2013年 com.litech. All rights reserved.


#import <UIKit/UIKit.h>
#import "DamageValueLabel.h"

@interface ViewController : UIViewController{
    int power;
    int hp;
    IBOutlet UILabel *powerLabel;
    IBOutlet UILabel *color1Label;
    IBOutlet UILabel *color2Label;
    IBOutlet UILabel *color3Label;
    IBOutlet UILabel *hpLabel;
}

-(IBAction)powerup;
-(IBAction)colorchange;
-(IBAction)attack;
-(IBAction)retry;






/* ----- ここから下は変更しない ----- */
@property (nonatomic, retain) IBOutlet UIImageView *charaImgView;
@property (nonatomic, retain) IBOutlet DamageValueLabel *damageLabel;
- (void)clear;
- (void)damageAnimation;





@end
