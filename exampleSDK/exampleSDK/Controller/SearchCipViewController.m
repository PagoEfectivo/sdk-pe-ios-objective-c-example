//
//  SearchCipViewController.m
//  exampleSDK
//
//  Created by gerardo on 20/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "SearchCipViewController.h"
#import "Help.h"
#import "ResultSearchCip.h"
@interface SearchCipViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *positionYBtnSearch;

@end

@implementation SearchCipViewController
static int counter = 0;
static NSMutableArray *arrayLbls;
static NSMutableArray *arrayCips;
static NSMutableArray *resulSearch;
- (void)viewDidLoad {
    [super viewDidLoad];
    arrayLbls = [[NSMutableArray alloc]init];
    arrayCips = [[NSMutableArray alloc]init];
    resulSearch = [[NSMutableArray alloc]init];
}

-(void)viewWillAppear:(BOOL)animated
{
    counter = 0;
    [arrayLbls removeAllObjects];
    [arrayCips removeAllObjects];
    [resulSearch removeAllObjects];
}

- (IBAction)addLblCip:(UIButton *)sender {

    if (counter < 5) {
        UITextField *aux = [[Help alloc]returnTextField:counter];
        [self.view addSubview: [[Help alloc]returnLabel:counter]];
        [self.view addSubview:aux];
        [arrayLbls addObject:aux];
        counter = counter + 1 ;
        _positionYBtnSearch.constant = (CGFloat) (37 + 45 * counter);
    } else {
        NSLog(@"%@",@"solamente hasta 5 cips");
    }
}


- (IBAction)searchCip:(UIButton *)sender {
    for (int index = 0; index < arrayLbls.count; index ++) {
        UITextField *cip = arrayLbls[index];
        [arrayCips addObject:cip.text];
    }
    
    [[PagoEfectivoSDK Cip]search:arrayCips responseHandler:^(long status, id receivedData, NSError *error) {
        if(error != nil){
            NSLog(@"%@",error);
        } else {
            NSDictionary *result = receivedData;
            NSArray * data = [result objectForKey:@"data"];
            for (NSDictionary *element in data) {
                ResultSearchCip *cipResultSearch = [ResultSearchCip alloc];
                cipResultSearch.amount = [[element objectForKey:@"amount"] doubleValue];
                cipResultSearch.numberCip = [[element objectForKey:@"amount"] intValue];
                cipResultSearch.currency = [element objectForKey:@"currency"];
                cipResultSearch.dateCreationCip = [element objectForKey:@"dateCreation"];
                cipResultSearch.dateExpiry = [element objectForKey:@"dateExpiry"];
                cipResultSearch.datePaymentCip = [element objectForKey:@"datePayment"];
                cipResultSearch.dateRemovalCip = [element objectForKey:@"dateRemoval"];
                cipResultSearch.statusCip = [[element objectForKey:@"status"] intValue];
                cipResultSearch.statusNameCip = [element objectForKey:@"statusName"];
                cipResultSearch.transactionCode = [element objectForKey:@"transactionCode"];
                [resulSearch addObject:cipResultSearch];
            }
        }
        NSLog(@"%@",resulSearch);
    }];
}


@end
