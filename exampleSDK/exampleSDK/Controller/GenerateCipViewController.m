//
//  GenerateCipViewController.m
//  exampleSDK
//
//  Created by gerardo on 20/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "GenerateCipViewController.h"
#import <PagoEfectivoSDK/PagoEfectivoSDK.h>
#import "CipResult.h"
#import "PaymentMethodTableViewController.h"

@interface GenerateCipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *currencyCip;
@property (weak, nonatomic) IBOutlet UITextField *amountCip;
@property (weak, nonatomic) IBOutlet UITextField *transactionCodeCip;
@property (weak, nonatomic) IBOutlet UITextField *dateExpiryCip;
@property (weak, nonatomic) IBOutlet UITextField *additionalDataCip;
@property (weak, nonatomic) IBOutlet UITextField *paymentConceptCip;
@property (weak, nonatomic) IBOutlet UITextField *userEmailCip;
@property (weak, nonatomic) IBOutlet UITextField *userNameCip;
@property (weak, nonatomic) IBOutlet UITextField *userLastNameCip;
@property (weak, nonatomic) IBOutlet UITextField *userUbigeoCip;
@property (weak, nonatomic) IBOutlet UITextField *userCountryCip;
@property (weak, nonatomic) IBOutlet UITextField *userDocumentTypeCip;
@property (weak, nonatomic) IBOutlet UITextField *userNumberDocCip;
@property (weak, nonatomic) IBOutlet UITextField *userPhoneCip;
@property (weak, nonatomic) IBOutlet UITextField *userCodeCountryCip;
@property (weak, nonatomic) IBOutlet UITextField *adminEmailCip;
@property (weak, nonatomic) IBOutlet UIButton *btnNextView;
@property CipRequest *dataCipRequest;
@property NSArray *currencyList;
@property NSArray *documentTypeList;
@property CipResult *cipResult;
@end

@implementation GenerateCipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currencyPicker = [[UIPickerView alloc] init];
    _documentTypePicker = [[UIPickerView alloc] init];
    _dateExpiry = [[UIDatePicker alloc]init];
    _currencyList = @[@"PEN",@"USD"];
    _documentTypeList = @[@"DNI",@"PAS",@"PAR",@"LMI",@"NAN"];
    self.currencyPicker.delegate = self;
    self.currencyPicker.dataSource = self;
    self.documentTypePicker.delegate = self;
    self.documentTypePicker.dataSource = self;
    self.currencyCip.inputView = _currencyPicker;
    self.userDocumentTypeCip.inputView = _documentTypePicker;
    self.dateExpiryCip.inputView = _dateExpiry;
    [_dateExpiry addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    _dateExpiry.timeZone = [NSTimeZone localTimeZone];
}

- (void)datePickerValueChanged:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm a"];
    self.dataCipRequest.dateExpiry = _dateExpiry.date;
    _dateExpiryCip.text = [dateFormatter stringFromDate:_dateExpiry.date];
}

- (IBAction)generateCip:(UIButton *)sender {
    
    _dataCipRequest = [CipRequest alloc];
    _dataCipRequest.currency = PEN; // default
    _dataCipRequest.transactionCode = self.transactionCodeCip.text;
    _dataCipRequest.additionalData = self.additionalDataCip.text;
    _dataCipRequest.paymentConcept = self.paymentConceptCip.text;
    _dataCipRequest.userEmail = self.userEmailCip.text;
    _dataCipRequest.userName = self.userNameCip.text;
    _dataCipRequest.userLastName = self.userLastNameCip.text;
    _dataCipRequest.userUbigeo = self.userUbigeoCip.text;
    _dataCipRequest.userCountry = self.userCountryCip.text;
    _dataCipRequest.userDocumentType = NONE; // default
    _dataCipRequest.userDocumentNumber = self.userNumberDocCip.text;
    _dataCipRequest.userPhone = self.userPhoneCip.text;
    _dataCipRequest.userCodeCountry = self.userCodeCountryCip.text;
    _dataCipRequest.adminEmail = self.adminEmailCip.text;
    if([_amountCip.text  isEqual: @""]) {
        _dataCipRequest.amount = 0;
    } else {
        _dataCipRequest.amount = [self.amountCip.text doubleValue];
    }

    [[PagoEfectivoSDK Cip]generate:self.dataCipRequest responseHandler:^(long status, id receivedData, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", error);
        } else {
            _cipResult = [CipResult alloc];
            NSDictionary *result = receivedData;
            NSDictionary * data = [result objectForKey:@"data"];
            _cipResult.amount = [[data objectForKey:@"amount"] doubleValue];
            _cipResult.currency = [data objectForKey:@"currency"];
            _cipResult.transactionCode = [data objectForKey:@"transactionCode"];
            _cipResult.dateExpiry = [data objectForKey:@"dateExpiry"];
            _cipResult.numberCip = [[data objectForKey:@"cip"] intValue];
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [self performSegueWithIdentifier:@"showPaymentMethod" sender:self];
            });
        }
    }];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == _currencyPicker) {
        return _currencyList.count;
    } else {
        return _documentTypeList.count;
    }
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == _currencyPicker) {
        return _currencyList[row];
    } else {
        return _documentTypeList[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == _currencyPicker) {
        _currencyCip.text = _currencyList[row];
    } else {
        _userDocumentTypeCip.text = _documentTypeList[row];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showPaymentMethod"]) {
        PaymentMethodTableViewController * view = [segue destinationViewController];
        view.cipResult = _cipResult;
    }
}
@end
