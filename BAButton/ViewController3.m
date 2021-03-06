//
//  ViewController3.m
//  BAButton
//
//  Created by 任子丰 on 17/5/25.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "ViewController3.h"
#import "BAButton.h"

@interface ViewController3 ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *countDownBtn;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Btn State";
    
    [self.btn1 ba_setBackgroundColor:BAKit_ColorRandom() forState:UIControlStateNormal animated:YES];
    [self.btn1 ba_setBackgroundColor:BAKit_ColorRandom() forState:UIControlStateSelected animated:YES];
    
    [self.btn2 ba_setBackgroundColor:BAKit_ColorRandom() forState:UIControlStateNormal animated:NO];
    [self.btn2 ba_setBackgroundColor:BAKit_ColorRandom() forState:UIControlStateSelected animated:NO];
    
    [self.btn3 ba_setborderColor:BAKit_ColorRandom() forState:UIControlStateNormal animated:YES];
    [self.btn3 ba_setborderColor:BAKit_ColorRandom() forState:UIControlStateSelected animated:YES];
    self.btn3.layer.borderWidth = 5;
    
    [self.btn4 ba_setborderColor:BAKit_ColorRandom() forState:UIControlStateNormal animated:YES];
    [self.btn4 ba_setborderColor:BAKit_ColorRandom() forState:UIControlStateSelected animated:YES];
    self.btn4.layer.borderWidth = 5;
    
    [self.btn5 ba_setTitleLabelFont:[UIFont systemFontOfSize:10] forState:UIControlStateNormal];
    [self.btn5 ba_setTitleLabelFont:[UIFont systemFontOfSize:12] forState:UIControlStateSelected];
    
    [self.btn6 ba_configBackgroundColors:@{@(UIControlStateNormal):BAKit_ColorRandom(),
                                           @(UIControlStateSelected):BAKit_ColorRandom()}];
    
    [self.btn7 ba_configBorderColors:@{@(UIControlStateNormal):BAKit_ColorRandom(),
                                       @(UIControlStateSelected):BAKit_ColorRandom()}];
    self.btn7.layer.borderWidth = 5;
    
    [self.btn8 ba_configTitleLabelFont:@{@(UIControlStateNormal):[UIFont systemFontOfSize:10],
                                         @(UIControlStateSelected):[UIFont systemFontOfSize:12]}];
    
}

- (void)dealloc {
    NSLog(@"释放了");
}

- (IBAction)btnClick:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}

- (IBAction)countDownClick:(UIButton *)sender {
    sender.userInteractionEnabled = NO;
    __block UIButton *btn = sender;
    [sender countDownWithTimeInterval:60 countDownFormat:@"剩余 %zd"];
    [sender setTimeStoppedCallback:^{
        [btn setTitle:@"倒计时" forState:UIControlStateNormal];
    }];

}

- (IBAction)skipClick:(UIButton *)sender {
    __block UIButton *btn = sender;
    [sender countDownWithTimeInterval:5 countDownFormat:@"跳过 %zd"];
    [sender setTimeStoppedCallback:^{
        [btn setTitle:@"跳过" forState:UIControlStateNormal];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
