//
//  VTTransactionDetails.h
//  VTiOSAPI
//
//  Created by Muhammad Anis on 12/11/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VTTransactionDetails : NSObject

@property(nonatomic,copy) NSString* order_id;
@property(nonatomic,assign) NSInteger gross_amount;

-(id)initWithOrderAndGross: (NSString*)orderId withGrossAmount:(NSInteger)grossAmount;

+(instancetype)transactionWithOrderAndGross :(NSString*)orderId withGrossAmount:(NSInteger)grossAmount;

@end
