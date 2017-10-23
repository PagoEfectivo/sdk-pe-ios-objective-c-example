//
//  Help.m
//  exampleSDK
//
//  Created by gerardo on 23/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import "Help.h"

@implementation Help


-(currency) StringToCurrency:(NSString*) value {
    
    NSMutableDictionary *hola = [NSMutableDictionary alloc];
    //[hola setValue: PEN forKey:@"PEN"];
    
    return PEN;
}

-(documentType) StringToDocumentType: (NSString*) value {
    
    
    return DNI;
}
@end
