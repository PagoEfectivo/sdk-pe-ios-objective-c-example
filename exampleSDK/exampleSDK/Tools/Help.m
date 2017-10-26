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
    currency (^currencySelected)(void) = @{
        @"PEN": ^{
            return PEN;
        },
        @"USD": ^{
            return USD;
        },
        @"":^{
            return NONE;
        }
    }[value];
    return currencySelected();
}

-(documentType) StringToDocumentType: (NSString*) value {
    documentType (^documentTypeSelected)(void) = @{
       @"DNI": ^{
           return DNI;
       },
       @"PASS": ^{
           return PASS;
       },
       @"LMI": ^{
           return LMI;
       },
       @"PAR": ^{
           return PAR;
       },
       @"": ^{
           return NANE;
       }
    }[value];
    return documentTypeSelected();
}

-(UILabel*) returnLabel : (int) numberLbel text: (NSString*)text positionX: (int)positionX positionY: (int)positionY width: (int)width height: (int)height {
    int distanceY = positionY + numberLbel * 45;
    int distanceX = positionX;
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(distanceX, distanceY , width, height)];
    UIFont * customFont = [UIFont fontWithName:@"System" size:14];
    lbl.textColor = [UIColor blackColor];
    lbl.textColor=[UIColor blackColor];
    lbl.font = customFont;
    lbl.numberOfLines = 0;
    lbl.textAlignment = NSTextAlignmentJustified;
    lbl.text= text;
    return lbl;
}

-(UITextField*) returnTextField : (int) numberLbel {
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 140 + 45*(int) numberLbel , 173, 35)];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setKeyboardType:UIKeyboardTypeNumberPad];
    return textField;
}

-(NSString*) getFormatterEvent: (NSString*)dateString {
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    return [self newFormatFor:[dateFormater dateFromString:dateString]];
}

-(NSString*) newFormatFor: (NSDate*)date {
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/MM/yyyy hh:mm a"];
    [dateFormater setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"es_PE"]];
    return [dateFormater stringFromDate:date];//dateFormater.string(from: date)
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

-(UIAlertController*) customAlert: (NSArray*) message time: (double) time {
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"Error!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIView *view = [[UIView alloc]init];
    CGFloat heigthAlert = 80;
    if (message.count > 1) {
        heigthAlert = ((75 - 5*(message.count-1))*message.count);
    }
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:alert.view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:heigthAlert];
    [alert.view addConstraint:height];
    for (int index = 0; index < message.count; index ++) {
        [view addSubview:[self returnLabel:index text:message[index] positionX:8 positionY:40 width:200 height:60]];
    }
    [alert.view addSubview:view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:true completion:nil];
    });
    return alert;
}
@end
