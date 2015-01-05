//
//  VTDirect.h
//  VTiOSAPI
//
//  Created by Muhammad Anis on 12/11/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VTBaseTransactionMethod.h"
#import "VTCardDetails.h"

@interface VTDirect : VTBaseTransactionMethod

@property(nonatomic,retain) VTCardDetails* card_details;

@end
