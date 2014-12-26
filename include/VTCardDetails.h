//
//  VTCardDetails.h
//  VTiOSAPI
//
//  Created by Muhammad Anis on 12/11/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

#ifndef VTiOSAPI_VTCardDetails_h
#define VTiOSAPI_VTCardDetails_h

#import <Foundation/Foundation.h>

@interface VTCardDetails : NSObject

@property(nonatomic,copy) NSString* card_number;
@property(nonatomic,copy) NSString* card_cvv;
@property(nonatomic,copy) NSString* bank;
@property(nonatomic,copy) NSString* gross_amount;

@property (nonatomic,assign) NSInteger card_exp_month;
@property (nonatomic,assign) NSInteger card_exp_year;

@property (nonatomic,assign) BOOL secure;

-(NSString*) getParamUrl;


@end

#endif
