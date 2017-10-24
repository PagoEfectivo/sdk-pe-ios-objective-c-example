//
//  MobilePaymentMethodTableViewController.m
//  exampleSDK
//
//  Created by gerardo on 20/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "MobilePaymentMethodTableViewController.h"
#import "SummaryViewController.h"

@interface MobilePaymentMethodTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numberCip;
@property (weak, nonatomic) IBOutlet UILabel *amountCip;
@property (weak, nonatomic) IBOutlet UILabel *dateExpiryCip;

@end

@implementation MobilePaymentMethodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberCip.text = [NSString stringWithFormat:@"%d",_cipResult.numberCip];
    self.amountCip.text = [NSString stringWithFormat:@"%.2f",_cipResult.amount];
    self.dateExpiryCip.text = _cipResult.dateExpiry;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if ( indexPath.row == 1) {
        [self performSegueWithIdentifier:@"summaryFromMobile" sender:self];
    } else {
        NSLog(@"%@",@"Opción incorrecta");
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"summaryFromMobile"]) {
        SummaryViewController * view = [segue destinationViewController];
        view.cipResult = _cipResult;
    }
}

@end
