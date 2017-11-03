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
#import "ResultSearchTableViewController.h"
@interface SearchCipViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *positionYBtnSearch;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;
@end

@implementation SearchCipViewController
static int counter = 0;
static NSMutableArray *arrayLbls;
static NSMutableArray *arrayCips;
static NSMutableArray *resultSearch;
- (void)viewDidLoad {
    [super viewDidLoad];
    arrayLbls = [[NSMutableArray alloc]init];
    arrayCips = [[NSMutableArray alloc]init];
    resultSearch = [[NSMutableArray alloc]init];
}

-(void)viewWillAppear:(BOOL)animated
{
    counter = 0;
    [arrayLbls removeAllObjects];
    [arrayCips removeAllObjects];
    [resultSearch removeAllObjects];
}

- (IBAction)addLblCip:(UIButton *)sender {

    if (counter < 5) {
        UITextField *aux = [[Help alloc]returnTextField:counter];
        [self.view addSubview: [[Help alloc]returnLabel:counter text:@"CIP" positionX:50 positionY:143 width:37 height:30]];
        [self.view addSubview:aux];
        [arrayLbls addObject:aux];
        counter = counter + 1 ;
        _positionYBtnSearch.constant = (CGFloat) (37 + 45 * counter);
        [aux becomeFirstResponder];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self presentViewController:[[Help alloc]simpleAlert:@"Número máximo de CIPS : 5" time:1.5]animated:true completion:nil];
        });
    }
}

- (IBAction)searchCip:(UIButton *)sender {
    _btnSearch.enabled = false;
    UIActivityIndicatorView *refresh = [[Help alloc] createRefresher:self.view];
    [refresh startAnimating];
    for (int index = 0; index < arrayLbls.count; index ++) {
        UITextField *cip = arrayLbls[index];
        [arrayCips addObject:cip.text];
    }
    
    [[PagoEfectivoSDK Cip]search:arrayCips responseHandler:^(long status, id receivedData, NSError *error) {
        if(error != nil){
            NSString * message = error.localizedDescription;
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [self presentViewController:[[Help alloc]simpleAlert:message time:2 ]animated:true completion:nil];
                _btnSearch.enabled = true;
                [arrayCips removeAllObjects];
                [refresh stopAnimating];
            });
        } else {
            NSDictionary *result = receivedData;
            NSArray * data = [result objectForKey:@"data"];
            for (NSDictionary *element in data) {
                ResultSearchCip *cipResultSearch = [ResultSearchCip alloc];
                cipResultSearch.amount = [[element objectForKey:@"amount"] doubleValue];
                cipResultSearch.numberCip = [[element objectForKey:@"cip"] intValue];
                cipResultSearch.currency = [element objectForKey:@"currency"];
                cipResultSearch.dateCreationCip = [element objectForKey:@"dateCreation"];
                cipResultSearch.dateExpiry = [element objectForKey:@"dateExpiry"];
                cipResultSearch.datePaymentCip = [element objectForKey:@"datePayment"];
                cipResultSearch.dateRemovalCip = [element objectForKey:@"dateRemoval"];
                cipResultSearch.statusCip = [[element objectForKey:@"status"] intValue];
                cipResultSearch.statusNameCip = [element objectForKey:@"statusName"];
                cipResultSearch.transactionCode = [element objectForKey:@"transactionCode"];
                [resultSearch addObject:cipResultSearch];
            }
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [self performSegueWithIdentifier:@"showResultSearch" sender:self];
                [refresh stopAnimating];
                _btnSearch.enabled = true;
            });
        }
    }];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showResultSearch"]) {
        ResultSearchTableViewController * view = [segue destinationViewController];
        view.arrayResultSearch = resultSearch;
    }
}
@end
