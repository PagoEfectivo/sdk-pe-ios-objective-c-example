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

@interface PaymentMethodTableViewController ()

@end

@implementation PaymentMethodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

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
        NSLog(@"%@",@"Opción incorrecta");
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
