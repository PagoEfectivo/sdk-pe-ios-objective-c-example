//
//  SummaryViewController.m
//  exampleSDK
//
//  Created by gerardo on 20/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController ()
@property (weak, nonatomic) IBOutlet UILabel *sumaryTitle;
@property (weak, nonatomic) IBOutlet UILabel *numerCip;

@end

@implementation SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * currencyType = @"S/.";
    if ([_cipResult.currency  isEqual: @"USD"]) {
        currencyType = @"$";
    }
    self.sumaryTitle.text = [NSString stringWithFormat:@"Paga %@ %.2f en BCP para reservar tu compra",currencyType, _cipResult.amount];
    self.numerCip.text = [NSString stringWithFormat:@"3. Díctale al cajero este código CIP : %d", _cipResult.numberCip];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
