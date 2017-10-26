//
//  Cip.h
//  exampleSDK
//
//  Created by gerardo on 23/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CipResult : NSObject
@property (assign) int numberCip;
@property (nonatomic,strong)NSString* dateExpiry;
@property (nonatomic,strong)NSString* transactionCode;
@property (assign) double amount;
@property (nonatomic,strong)NSString* currency;
@end
