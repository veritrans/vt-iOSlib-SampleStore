//
//  VTItemDetails.h
//  VTiOSAPI
//
//  Created by Muhammad Anis on 12/11/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

#ifndef VTiOSAPI_VTItemDetails_h
#define VTiOSAPI_VTItemDetails_h

#import <Foundation/Foundation.h>

@interface VTItemDetails : NSObject

@property(nonatomic,copy) NSString* itemId;
@property(nonatomic,assign) NSInteger price;
@property(nonatomic,assign) NSInteger quantity;
@property(nonatomic,copy) NSString* name;

@end

#endif
