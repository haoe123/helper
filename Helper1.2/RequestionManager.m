//
//  RequestionManager.m
//  addImageWithURL
//
//  Created by qianfeng0 on 16/1/19.
//  Copyright © 2016年 李新亚. All rights reserved.
//

#import "RequestionManager.h"

static RequestionManager *manager;

@implementation RequestionManager

+ (void)GET:(NSString *)url succes:(Succes)succes failed:(Failed)failed{
    if (!manager) {
        manager = [[RequestionManager alloc]init];
    }
    [manager GET:url succes:succes failed:failed];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.webData = [[NSMutableData alloc]init];
    }
    return self;
}

- (void)GET:(NSString *)url succes:(Succes)succes failed:(Failed)failed{
    self.succes = succes;
    self.failed = failed;
    NSURL *URL= [NSURL URLWithString:url];
    [self getNetDataWithURL:URL];
}

- (void)getNetDataWithURL:(NSURL *)url{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [self.connection start];
}

#pragma  mark 代理协议
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    self.failed(error);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.webData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    self.succes(self.webData);
    [self.webData setLength:0];
}


@end
