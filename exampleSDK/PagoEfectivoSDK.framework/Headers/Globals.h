//
//  Globals.h
//  PagoEfectivoSDK
//
//  Created by Andres on 9/15/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^serviceCallback)(long status, id receivedData, NSError *error);

//Global enums
typedef enum {
    PEN = 1,
    USD
}currency;

typedef enum {
    DNI,
    PASS,
    LMI,
    PAR,
    NANE
}documentType;

typedef enum {
    ES,
    EN
} language;

typedef enum {
    SUCCESS_AUTHORIZATION, // 201
    SUCCESS_GENERATE_CIP, // 201
    SUCCESS_SEARCH_CIP,
    BAD_REQUEST, //400
    UNAUTHORIZED, //401
    INTERNAL_ERROR //500
} API_STATUS;


@interface Globals : NSObject
+(NSString*)currencyToString: (currency)value;
+(NSString*)documentTypeToString: (documentType)value;
+(NSString*)languageToString: (language)value;
+(NSString*)getURLService;
+(long)getAPIStatus: (API_STATUS)value;
@end
