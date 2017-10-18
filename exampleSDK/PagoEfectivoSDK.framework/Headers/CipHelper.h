//
//  CipHelper.h
//  PagoEfectivoSDK
//
//  Created by gerardo on 20/09/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Globals.h"

@interface CipHelper : NSObject

+(BOOL)validateCurrency:(currency) currency;
+(BOOL)validateAmount:(double)amount;
+(BOOL)validateTransactionCode:(NSString*)transactionCode;
+(BOOL)validateUserEmail:(NSString*)userEmail;
+(BOOL)validateArrayCip:(NSArray *)cips;
@end
