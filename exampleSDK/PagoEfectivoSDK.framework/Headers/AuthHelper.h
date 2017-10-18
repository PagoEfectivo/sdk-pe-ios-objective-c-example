//
//  AuthHelper.h
//  PagoEfectivoSDK
//
//  Created by gerardo on 18/09/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthHelper : NSObject
+(BOOL)validateIdService:(int)ServiceId;
+(BOOL)validateAccessKey:(NSString*)accessKey;
+(BOOL)validateSecretKey:(NSString*)secretKey;
@end
