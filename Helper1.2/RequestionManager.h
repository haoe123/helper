//
//  RequestionManager.h
//  addImageWithURL
//
//  Created by qianfeng0 on 16/1/19.
//  Copyright © 2016年 李新亚. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Succes) (id responseObjct);
typedef void(^Failed) (NSError *error);

@interface RequestionManager : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,strong)NSURLConnection *connection;
@property (nonatomic,strong)NSMutableData *webData;
@property (nonatomic,copy)Succes succes;
@property (nonatomic,copy)Failed failed;

+ (void)GET:(NSString *)url succes:(Succes)succes failed:(Failed)failed;

@end
