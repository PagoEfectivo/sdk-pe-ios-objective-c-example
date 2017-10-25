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
#import "Help.h"

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
@property (weak, nonatomic) IBOutlet UIButton *btngenerateCip;
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
    [self setupPicker:_currencyPicker];
    [self setupPicker:_documentTypePicker];
    [self setupDatePicker:_dateExpiry];
    [self inputPickertoTextField:_currencyCip picker:_currencyPicker];
    [self inputPickertoTextField:_userDocumentTypeCip picker:_documentTypePicker];
    self.dateExpiryCip.inputView = _dateExpiry;
}
-(void)viewWillAppear:(BOOL)animated
{
    _currencyList = @[@"PEN",@"USD"];
    _documentTypeList = @[@"DNI",@"PAS",@"PAR",@"LMI",@"NAN"];
    _btngenerateCip.enabled = true;
}

- (void) setupPicker: (UIPickerView*) picker {
    picker.delegate = self;
    picker.dataSource = self;
}

- (void) setupDatePicker: (UIDatePicker*) pickerDate {
    [pickerDate addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    pickerDate.timeZone = [NSTimeZone localTimeZone];
}

- (void) inputPickertoTextField: (UITextField*) textField picker: (UIPickerView*)picker {
    textField.inputView = picker;
}

- (void)datePickerValueChanged:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm a"];
    self.dataCipRequest.dateExpiry = _dateExpiry.date;
    _dateExpiryCip.text = [dateFormatter stringFromDate:_dateExpiry.date];
}

- (IBAction)generateCip:(UIButton *)sender {
    
    _btngenerateCip.enabled = false;
    UIActivityIndicatorView *refresh = [[Help alloc] createRefresher:self.view];
    [refresh startAnimating];
    _dataCipRequest = [CipRequest alloc];
    _dataCipRequest.currency = [[Help alloc]StringToCurrency:self.currencyCip.text];
    _dataCipRequest.transactionCode = self.transactionCodeCip.text;
    _dataCipRequest.additionalData = self.additionalDataCip.text;
    _dataCipRequest.paymentConcept = self.paymentConceptCip.text;
    _dataCipRequest.userEmail = self.userEmailCip.text;
    _dataCipRequest.userName = self.userNameCip.text;
    _dataCipRequest.userLastName = self.userLastNameCip.text;
    _dataCipRequest.userUbigeo = self.userUbigeoCip.text;
    _dataCipRequest.userCountry = self.userCountryCip.text;
    _dataCipRequest.userDocumentType = [[Help alloc]StringToDocumentType:self.userDocumentTypeCip.text];
    _dataCipRequest.userDocumentNumber = self.userNumberDocCip.text;
    _dataCipRequest.userPhone = self.userPhoneCip.text;
    _dataCipRequest.userCodeCountry = self.userCodeCountryCip.text;
    _dataCipRequest.adminEmail = self.adminEmailCip.text;
    _dataCipRequest.amount = 0;
    if(![_amountCip.text  isEqual: @""]) {
        _dataCipRequest.amount = [self.amountCip.text doubleValue];
    }
    NSMutableArray *errorsForUser = [[NSMutableArray alloc]init];
    [[PagoEfectivoSDK Cip]generate:self.dataCipRequest responseHandler:^(long status, id receivedData, NSError *error) {
        if (error != nil) {
            NSDictionary *errors = error.userInfo;
            NSArray *arrayaux  = [errors valueForKey:@"errorsFounded"];
            for (int index = 0; index < arrayaux.count; index ++) {
                NSDictionary *dictionaryAux = arrayaux[index];
                [errorsForUser addObject:[NSString stringWithFormat:@"%d.%@ ",(index+1), [dictionaryAux valueForKey:@"message"]]];
            }
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [refresh stopAnimating];
                [self presentViewController:[[Help alloc]customAlert:errorsForUser time:2] animated:true completion:nil];
            });
             _btngenerateCip.enabled = true;
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
                [refresh stopAnimating];
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
    NSInteger numberRows = _documentTypeList.count;
    if (pickerView == _currencyPicker) {
        numberRows = _currencyList.count;
    }
    return numberRows;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = _documentTypeList[row];
    if (pickerView == _currencyPicker) {
        title = _currencyList[row];
    }
    return title;
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
