//
//  ResultSearchCip.h
//  exampleSDK
//
//  Created by gerardo on 24/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultSearchCip : NSObject
@property (assign) double amount;
@property (assign) int numberCip;
@property (nonatomic,strong)NSString* currency;
@property (nonatomic,strong)NSString* dateExpiry;
@property (nonatomic,strong)NSString* transactionCode;
@property (assign) int statusCip;
@property (nonatomic,strong)NSString* statusNameCip;
@property (nonatomic,strong)NSString* dateCreationCip;
@property (nonatomic,strong)NSString* datePaymentCip;
@property (nonatomic,strong)NSString* dateRemovalCip;
@end
