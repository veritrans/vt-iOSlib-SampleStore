//
//  VTBaseTransaction.h
//  VTiOSAPI
//
//  Created by Muhammad Anis on 12/11/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

#ifndef VTiOSAPI_VTBaseTransaction_h
#define VTiOSAPI_VTBaseTransaction_h

#import <Foundation/Foundation.h>
#import "VTTransactionDetails.h"
#import "VTCustomerDetails.h"

@interface VTBaseTransaction : NSObject

@property(nonatomic,copy) NSString* payment_type;
@property(nonatomic,retain) VTTransactionDetails* transaction_details;
@property(nonatomic,retain) VTCustomerDetails* customer_details;
@property(nonatomic,retain) NSMutableArray* item_details;


@end

#endif
