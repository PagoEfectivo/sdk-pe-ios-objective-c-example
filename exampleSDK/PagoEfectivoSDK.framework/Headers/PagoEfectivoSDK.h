//
//  PagoEfectivoSDK.h
//  PagoEfectivoSDK
//
//  Created by Andres on 9/11/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for PagoEfectivoSDK.
FOUNDATION_EXPORT double PagoEfectivoSDKVersionNumber;

//! Project version string for PagoEfectivoSDK.
FOUNDATION_EXPORT const unsigned char PagoEfectivoSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PagoEfectivoSDK/PublicHeader.h>
#import <PagoEfectivoSDK/Cip.h>
#import <PagoEfectivoSDK/Auth.h>
#import <PagoEfectivoSDK/Credential.h>
#import <PagoEfectivoSDK/CipRequest.h>

@interface PagoEfectivoSDK: NSObject

//Methods
+(Cip*) Cip;
+(void) config:(NSString*)secretKey accessKey:(NSString*)accessKey serviceId:(int)serviceId;

@end
