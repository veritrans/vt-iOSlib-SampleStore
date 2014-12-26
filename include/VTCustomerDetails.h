//
//  VTCustomerDetails.h
//  VTiOSAPI
//
//  Created by Muhammad Anis on 12/11/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

#ifndef VTiOSAPI_VTCustomerDetails_h
#define VTiOSAPI_VTCustomerDetails_h

#import <Foundation/Foundation.h>

@interface VTCustomerDetails : NSObject

@property(nonatomic,copy) NSString* first_name;
@property(nonatomic,copy) NSString* last_name;
@property(nonatomic,copy) NSString* email;
@property(nonatomic,copy) NSString* phone;

@end

#endif
