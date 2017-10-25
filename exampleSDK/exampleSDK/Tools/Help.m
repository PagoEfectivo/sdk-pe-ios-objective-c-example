//
//  Help.m
//  exampleSDK
//
//  Created by gerardo on 23/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "Help.h"

@implementation Help

-(currency) StringToCurrency:(NSString*) value {
    currency aux = NONE;
    if([value  isEqual: @"PEN"]) {
        aux = PEN;
    }
    if ([value  isEqual: @"USD"]) {
        aux = USD;
    }
    return aux;
}

-(documentType) StringToDocumentType: (NSString*) value {
    documentType aux = NANE;
    if([value  isEqual: @"DNI"]) {
        aux = DNI;
    }
    if([value  isEqual: @"PASS"]) {
        aux = PASS;
    }
    if([value  isEqual: @"LMI"]) {
        aux = LMI;
    }
    if([value  isEqual: @"PAR"]) {
        aux = PAR;
    }
    return aux;
}

-(UILabel*) returnLabel : (int) numberLbel {

    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(70, 140 + 45*(int) numberLbel , 50, 40)];
    UIFont * customFont = [UIFont fontWithName:@"System" size:15];
    lbl.textColor = [UIColor blackColor];
    lbl.textColor=[UIColor blackColor];
    lbl.font = customFont;
    lbl.text= @"CIP";
    
    return lbl;
}

-(UITextField*) returnTextField : (int) numberLbel {
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(130, 140 + 45*(int) numberLbel , 173, 35)];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setKeyboardType:UIKeyboardTypeNumberPad];
    
    return textField;
}

-(NSString*) stringToTypeDate : (NSString*) string {
    
    NSString *aux = string;
    NSString *year = [aux substringToIndex:4];
    NSString *month = [aux substringWithRange:NSMakeRange(5,2)];
    NSString *day = [aux substringWithRange:NSMakeRange(8,2)];
    NSString *hour = [aux substringWithRange:NSMakeRange(11,2)];
    NSString *min = [aux substringWithRange:NSMakeRange(14,2)];
    NSString *sec = [aux substringWithRange:NSMakeRange(17,2)];
    
    return [NSString stringWithFormat: @"%@/%@/%@ %@:%@:%@", day,month,year,hour,min,sec];
}

-(UIActivityIndicatorView*) createRefresher: (UIView*)view {
    
    UIActivityIndicatorView *refresh = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    refresh.hidesWhenStopped = true;
    refresh.center = view.center;
    [view addSubview:refresh];
    return refresh;
}

-(UIAlertController*) simpleAlert: (NSString*) message time: (double) time {
    
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"Error!" message:message preferredStyle:UIAlertControllerStyleAlert];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:true completion:nil];
    });
    return alert;
}

/*-(UIAlertController*) customAlert: (NSArray*) message time: (double) time {
    
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"Error!" message:message preferredStyle:UIAlertControllerStyleAlert];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:true completion:nil];
    });
    return alert;
}*/

@end
