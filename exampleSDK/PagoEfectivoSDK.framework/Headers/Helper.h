//
//  Helper.h
//  PagoEfectivoSDK
//
//  Created by Andres on 9/18/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Globals.h"

@interface Helper : NSObject
+(NSString *) setFormDataFromDictionary: (NSDictionary *)input;
+(void) callService:(NSString *)url headers:(NSDictionary *)headers params:(id)params responseHandler:(serviceCallback) callback;
+(void) callService:(NSString *)url params:(id)params responseHandler:(serviceCallback) callback;
+(NSString *) getDateToRequest;
+(NSString *) generateHashToRequest: (int)idService accessKey:(NSString *)accessKey
                                                    secretKey:(NSString *)secretKey
                                                  dateRequest:(NSString *)dateRequest;
+(NSDictionary *) generateDictionaryFromArray: (NSArray *) nsarray;
@end
