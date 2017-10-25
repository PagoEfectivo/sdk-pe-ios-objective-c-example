//
//  Help.h
//  exampleSDK
//
//  Created by gerardo on 23/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PagoEfectivoSDK/PagoEfectivoSDK.h>
@interface Help : NSObject

-(currency) StringToCurrency:(NSString*) value;
-(documentType) StringToDocumentType: (NSString*) value;
-(UILabel*) returnLabel : (int) numberLbel;
-(UITextField*) returnTextField : (int) numberLbel;
-(NSString*) stringToTypeDate : (NSString*) string;
-(UIActivityIndicatorView*) createRefresher: (UIView*)view;
-(UIAlertController*) simpleAlert: (NSString*) message time: (double) time;
@end
