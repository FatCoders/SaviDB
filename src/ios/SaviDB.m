/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "SaviDB.h"
#import <Cordova/CDV.h>
#import <Cordova/CDVPluginResult.h>

@implementation SaviDB

- (void)set:(CDVInvokedUrlCommand*)command
{

    NSString* key = [command.arguments objectAtIndex:0];
    NSString* value = [command.arguments objectAtIndex:1];
        CDVPluginResult* result =nil;
    
        if (key != nil && value != nil) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:value forKey:key];
        [userDefaults synchronize];
        
         result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NSUSserDefaults saved"];
        }else{
          result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)get:(CDVInvokedUrlCommand*)command
{
    NSString* key = [command.arguments objectAtIndex:0];
        CDVPluginResult* result =nil;
        if (key != nil) {
 
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            
             result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[userDefaults  stringForKey:key]];
        }else{
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)remove:(CDVInvokedUrlCommand*)command
{
    NSString* key = [command.arguments objectAtIndex:0];
    CDVPluginResult* result =nil;
    if (key != nil) {
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults removeObjectForKey:key];
            [userDefaults synchronize];
            
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NSUSserDefaults remove the key"];
        }else{
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }

        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


- (void)clear:(CDVInvokedUrlCommand*)command
{
       NSLog(@"clearclearclearclearclearclear");
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NSUSserDefaults cleared"];
    [result setKeepCallbackAsBool:false];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
