//
//  DetailSearchCipTableViewCell.h
//  exampleSDK
//
//  Created by gerardo on 24/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailSearchCipTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberCip;
@property (weak, nonatomic) IBOutlet UILabel *transactionCodeCip;
@property (weak, nonatomic) IBOutlet UILabel *amountCip;
@property (weak, nonatomic) IBOutlet UILabel *curencyCip;
@property (weak, nonatomic) IBOutlet UILabel *statusCip;
@property (weak, nonatomic) IBOutlet UILabel *statusNameCip;
@property (weak, nonatomic) IBOutlet UILabel *dateCreationCip;
@property (weak, nonatomic) IBOutlet UILabel *dateExpiryCip;
@property (weak, nonatomic) IBOutlet UILabel *datePaymentCip;
@property (weak, nonatomic) IBOutlet UILabel *dateRemovalCip;
@property (weak, nonatomic) IBOutlet UIView *viewMain;

@end
