//
//  CIP.h
//  PagoEfectivoSDK
//
//  Created by Andres on 9/15/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Globals.h"
#import "Helper.h"
#import "CipRequest.h"
#import "Credential.h"
#import "CipHelper.h"
#import "CipSearch.h"

typedef void (^serviceCallbackCipSearch)(long status, NSMutableArray *cipSearchArray, NSError *error);
@interface Cip : NSObject
//properties
@property Credential *credentialInstance;

//methods
+(instancetype) shared: (Credential *)credentialInstance;

//generate
-(void) generate:(CipRequest *)requestObject responseHandler:(serviceCallback) callback;
-(void) generate:(language)language requestObject:(CipRequest *)requestObject responseHandler:(serviceCallback) callback;

//search
-(void) search:(NSArray *)params responseHandler:(serviceCallbackCipSearch) callback;
-(void) search:(language)language params:(NSArray *)params responseHandler:(serviceCallbackCipSearch) callback;
@end
