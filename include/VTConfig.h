//
//  VTConfig.h
//  VTiOSAPI
//
//  Created by Muhammad Anis on 12/11/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

#ifndef VTiOSAPI_VTConfig_h
#define VTiOSAPI_VTConfig_h


#import <Foundation/Foundation.h>

@interface VTConfig : NSObject

+(NSString*) CLIENT_KEY;
+(void) setCLIENT_KEY:(NSString*)val;

+(BOOL)VT_IsProduction;
+(void)setVT_IsProduction:(BOOL)val;

+(NSString*)getTokenUrl;

@end

#endif
