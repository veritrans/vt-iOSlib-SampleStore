//
//  VTAddress.h
//  VTiOSAPI
//
//  Created by Muhammad Anis on 12/10/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

#ifndef VTiOSAPI_VTAddress_h
#define VTiOSAPI_VTAddress_h

#import <Foundation/Foundation.h>

@interface VTAddress : NSObject

@property(nonatomic,copy) NSString* first_name;
@property(nonatomic,copy) NSString* last_name;
@property(nonatomic,copy) NSString* address;
@property(nonatomic,copy) NSString* city;
@property(nonatomic,copy) NSString* postal_code;
@property(nonatomic,copy) NSString* phone;
@property(nonatomic,copy) NSString* country_code;


@end

#endif
