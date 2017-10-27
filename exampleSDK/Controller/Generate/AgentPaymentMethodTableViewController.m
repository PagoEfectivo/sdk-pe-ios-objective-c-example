//
//  AgentPaymentMethodTableViewController.m
//  exampleSDK
//
//  Created by gerardo on 20/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "AgentPaymentMethodTableViewController.h"
#import "SummaryViewController.h"
#import "Help.h"

@interface AgentPaymentMethodTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numberCip;
@property (weak, nonatomic) IBOutlet UILabel *amountCip;
@property (weak, nonatomic) IBOutlet UILabel *dateExpiryCip;
@end

@implementation AgentPaymentMethodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberCip.text = [NSString stringWithFormat:@"%d",_cipResult.numberCip];
    self.amountCip.text = [NSString stringWithFormat:@" S/. %.2f",_cipResult.amount];
    if([_cipResult.currency  isEqual: @"USD"]) {
        self.amountCip.text = [NSString stringWithFormat:@" $ %.2f",_cipResult.amount];
    }
    self.dateExpiryCip.text = [[Help alloc]getFormatterEvent:_cipResult.dateExpiry];//[[Help alloc]stringToTypeDate:_cipResult.dateExpiry];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ( indexPath.row == 1) {
        [self performSegueWithIdentifier:@"summaryFromAgent" sender:self];
    } else {
        [self presentViewController:[[Help alloc]customAlert:@[@"Opción incorrecta"] time:1.5]animated:true completion:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"summaryFromAgent"]) {
        SummaryViewController * view = [segue destinationViewController];
        view.cipResult = _cipResult;
    }
}
@end
