//
//  ResultSearchTableViewController.m
//  exampleSDK
//
//  Created by gerardo on 25/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "ResultSearchTableViewController.h"
#import "DetailSearchCipTableViewCell.h"
#import "ResultSearchCip.h"
#import "Help.h"
@interface ResultSearchTableViewController ()
@end

@implementation ResultSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super didReceiveMemoryWarning];
    UINib *cellNib = [UINib nibWithNibName:@"DetailSearchCipTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"DetailSearchCipTableViewCell"];
    
}

-(void)viewWillAppear:(BOOL)animated
{
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayResultSearch.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailSearchCipTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"DetailSearchCipTableViewCell" owner:self options:nil] firstObject];
    ResultSearchCip *aux = _arrayResultSearch[indexPath.row];
    cell.numberCip.text = [NSString stringWithFormat: @"%d", aux.numberCip];
    cell.transactionCodeCip.text = aux.transactionCode;
    cell.amountCip.text = [NSString stringWithFormat: @"%.2f", aux.amount];
    cell.curencyCip.text = aux.currency;
    cell.statusCip.text = [NSString stringWithFormat: @"%d", aux.statusCip];
    cell.statusNameCip.text = aux.statusNameCip;
    cell.dateCreationCip.text = [[Help alloc]getFormatterEvent:aux.dateCreationCip];
    cell.dateExpiryCip.text = [[Help alloc]getFormatterEvent:aux.dateExpiry];
    cell.datePaymentCip.text = [[Help alloc]getFormatterEvent:aux.datePaymentCip];
    cell.dateRemovalCip.text = [[Help alloc]getFormatterEvent:aux.dateRemovalCip];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 320;
}
@end
