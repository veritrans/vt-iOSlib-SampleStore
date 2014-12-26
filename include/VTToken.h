//
//  VTToken.h
//  VTiOSAPI
//
//  Created by Muhammad Anis on 12/11/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VTToken : NSObject

@property(nonatomic,copy) NSString* status_code;
@property(nonatomic,copy) NSString* status_message;
@property(nonatomic,copy) NSString* redirect_url;
@property(nonatomic,copy) NSString* token_id;
@property(nonatomic,copy) NSString* bank;

@end
