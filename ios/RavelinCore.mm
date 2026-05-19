#import <RavelinCoreSpec/RavelinCoreSpec.h>
#import <RavelinCore/RavelinCore-Swift.h>

@interface RavelinCore : NSObject <NativeRavelinCoreSpec>
@end

@implementation RavelinCore

RCT_EXPORT_MODULE()

+ (BOOL)requiresMainQueueSetup {
  return NO;
}

#pragma mark - Helpers

- (BOOL)ensureConfigured:(RCTPromiseRejectBlock)reject {
  if ([Ravelin shared].apiKey == nil) {
    reject(@"not_configured",
           @"Ravelin SDK has not been configured",
           [NSError errorWithDomain:@"RavelinCore" code:-1 userInfo:nil]);
    return NO;
  }
  return YES;
}

#pragma mark - Configuration

- (void)configure:(NSString *)apiKey
       appVersion:(NSString *)appVersion
          resolve:(RCTPromiseResolveBlock)resolve
           reject:(RCTPromiseRejectBlock)reject {
  [Ravelin createInstance:apiKey];
  [Ravelin shared].appVersion = appVersion;
  resolve(nil);
}

- (void)getDeviceId:(RCTPromiseResolveBlock)resolve
             reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  NSString *deviceId = [Ravelin shared].deviceId;
  if (deviceId && deviceId.length > 0) {
    resolve(deviceId);
  } else {
    reject(@"device_id_not_available",
           @"Device ID could not be fetched",
           [NSError errorWithDomain:@"RavelinCore" code:-1 userInfo:nil]);
  }
}

- (void)setCustomerId:(NSString *)customerId
              resolve:(RCTPromiseResolveBlock)resolve
               reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [Ravelin shared].customerId = customerId;
  resolve(nil);
}

- (void)setOrderId:(NSString *)orderId
           resolve:(RCTPromiseResolveBlock)resolve
            reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [Ravelin shared].orderId = orderId;
  resolve(nil);
}

#pragma mark - Tracking

- (void)trackPage:(NSString *)pageTitle
             data:(NSDictionary *)data
          resolve:(RCTPromiseResolveBlock)resolve
           reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackPage:pageTitle
              eventProperties:data
            completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackSearch:(NSString *)pageTitle
        searchValue:(NSString *)searchValue
            resolve:(RCTPromiseResolveBlock)resolve
             reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackSearch:pageTitle
                    searchValue:searchValue
              completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackSelectOption:(NSString *)pageTitle
                   option:(NSString *)option
              optionValue:(NSString *)optionValue
                  resolve:(RCTPromiseResolveBlock)resolve
                   reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackSelectOption:pageTitle
                               option:option
                          optionValue:optionValue
                    completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackAddToCart:(NSString *)pageTitle
              itemName:(NSString *)itemName
              quantity:(double)quantity
               resolve:(RCTPromiseResolveBlock)resolve
                reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackAddToCart:pageTitle
                          itemName:itemName
                          quantity:@(quantity)
                 completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackRemoveFromCart:(NSString *)pageTitle
                   itemName:(NSString *)itemName
                   quantity:(double)quantity
                    resolve:(RCTPromiseResolveBlock)resolve
                     reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackRemoveFromCart:pageTitle
                               itemName:itemName
                               quantity:@(quantity)
                      completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackAddToWishlist:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                   resolve:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackAddToWishlist:pageTitle
                              itemName:itemName
                     completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackRemoveFromWishlist:(NSString *)pageTitle
                       itemName:(NSString *)itemName
                        resolve:(RCTPromiseResolveBlock)resolve
                         reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackRemoveFromWishlist:pageTitle
                                   itemName:itemName
                          completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackLanguageChange:(NSString *)pageTitle
                   language:(NSString *)language
                    resolve:(RCTPromiseResolveBlock)resolve
                     reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackLanguageChange:pageTitle
                               language:language
                      completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackCurrencyChange:(NSString *)pageTitle
                   currency:(NSString *)currency
                    resolve:(RCTPromiseResolveBlock)resolve
                     reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackCurrencyChange:pageTitle
                               currency:currency
                      completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackViewContent:(NSString *)pageTitle
             contentType:(NSString *)contentType
                 resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackViewContent:pageTitle
                         contentType:contentType
                   completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackEvent:(NSString *)eventType
         pageTitle:(NSString *)pageTitle
              data:(NSDictionary *)data
           resolve:(RCTPromiseResolveBlock)resolve
            reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] track:pageTitle
                eventName:eventType
          eventProperties:data
        completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackLogin:(NSString *)pageTitle
              data:(NSDictionary *)data
           resolve:(RCTPromiseResolveBlock)resolve
            reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackLogin:pageTitle
               eventProperties:data
             completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackLogOut:(NSString *)pageTitle
               data:(NSDictionary *)data
            resolve:(RCTPromiseResolveBlock)resolve
             reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackLogout:pageTitle
                eventProperties:data
              completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackFingerprint:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackFingerprint:nil
                   completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)trackPaste:(NSString *)pageTitle
       pastedValue:(NSString *)pastedValue
           resolve:(RCTPromiseResolveBlock)resolve
            reject:(RCTPromiseRejectBlock)reject {
  if (![self ensureConfigured:reject]) return;
  [[Ravelin shared] trackPaste:pageTitle
                   pastedValue:pastedValue
             completionHandler:^(NSData *d, NSURLResponse *r, NSError *error) {
    error ? reject(@"track_error", error.localizedDescription, error) : resolve(nil);
  }];
}

- (void)cleanup:(RCTPromiseResolveBlock)resolve
         reject:(RCTPromiseRejectBlock)reject {
  resolve(nil);
}

#pragma mark - TurboModule

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeRavelinCoreSpecJSI>(params);
}

@end
