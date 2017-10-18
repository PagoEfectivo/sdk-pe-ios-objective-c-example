//
//  CipSearch.h
//  PagoEfectivoSDK
//
//  Created by gerardo on 27/09/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CipSearch : NSObject

@property (assign) int cip;
@property (nonatomic,strong)NSString* transactionCode;
@property (assign) double amount;
@property (nonatomic,strong)NSString* currency;
@property (assign) int status;
@property (nonatomic,strong)NSString* statusName;
@property (nonatomic,strong)NSString* dateCreation;
@property (nonatomic,strong)NSString* dateExpiry;
@property (nonatomic,strong)NSString* datePayment;
@property (nonatomic,strong)NSString* dateRemoval;

@end
