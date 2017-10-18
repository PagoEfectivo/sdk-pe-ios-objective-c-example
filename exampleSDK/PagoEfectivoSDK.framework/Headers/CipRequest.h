//
//  CipRequest.h
//  PagoEfectivoSDK
//
//  Created by gerardo on 20/09/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Globals.h"


@interface CipRequest: NSObject

@property (nonatomic, assign)currency currency; // requerido de tipo
@property (assign) double amount; // requerido
@property (nonatomic,strong)NSString* transactionCode; // requerido
@property (nonatomic,strong)NSString* adminEmail;
@property (nonatomic,strong)NSString* dateExpiry;
@property (nonatomic,strong)NSString* paymentConcept;
@property (nonatomic,strong)NSString* additionalData;
@property (nonatomic,strong)NSString* userEmail; // requerido
@property (nonatomic,strong)NSString* userName;
@property (nonatomic,strong)NSString* userLastName;
@property (nonatomic,strong)NSString* userUbigeo;
@property (nonatomic,strong)NSString* userCountry;
@property (nonatomic, assign)documentType userDocumentType; // de tipo
@property (nonatomic,strong)NSString* userDocumentNumber;
@property (nonatomic,strong)NSString* userPhone;
@property (nonatomic,strong)NSString* userCodeCountry;
@property (assign) int serviceId;
@end
