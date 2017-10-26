//
//  PaymentMethodTableViewController.m
//  exampleSDK
//
//  Created by gerardo on 20/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "PaymentMethodTableViewController.h"
#import "MobilePaymentMethodTableViewController.h"
#import "AgentPaymentMethodTableViewController.h"
#import "Help.h"

@interface PaymentMethodTableViewController ()
@end

@implementation PaymentMethodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ( indexPath.row == 0) {
        [self performSegueWithIdentifier:@"showMobileMethod" sender:self];
    } else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"showAgentMethod" sender:self];
    } else {
        [self presentViewController:[[Help alloc]customAlert:@[@"Opción incorrecta"] time:1.5]animated:true completion:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showMobileMethod"]) {
        MobilePaymentMethodTableViewController * view = [segue destinationViewController];
        view.cipResult = _cipResult;
    }
    if ([segue.identifier isEqualToString:@"showAgentMethod"]) {
        AgentPaymentMethodTableViewController * view = [segue destinationViewController];
        view.cipResult = _cipResult;
    }
}
@end
