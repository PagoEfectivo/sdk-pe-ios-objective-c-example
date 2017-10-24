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
    
    //NSMutableDictionary *hola = [NSMutableDictionary alloc];
    //[hola setValue: PEN forKey:@"PEN"];
    
    return PEN;
}

-(documentType) StringToDocumentType: (NSString*) value {
    
    
    return DNI;
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

@end
