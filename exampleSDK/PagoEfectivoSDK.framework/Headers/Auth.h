//
//  Auth.h
//  PagoEfectivoSDK
//
//  Created by Andres on 9/19/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Globals.h"
#import "Helper.h"
#import "Credential.h"

@interface Auth : NSObject
+(void)requestToken: (language)language credentialInstance:(Credential*)credentialInstance responseHandler:(serviceCallback)responseHandler;
@end
