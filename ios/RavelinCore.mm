#import <RavelinCoreSpec/RavelinCoreSpec.h>
#import <react-native-ravelin/react_native_ravelin-Swift.h>

@interface RavelinCore : NSObject <NativeRavelinCoreSpec>
@end

@implementation RavelinCore {
  RavelinReactNative *_impl;
}

RCT_EXPORT_MODULE()

- (instancetype)init {
  self = [super init];
  if (self) {
    _impl = [[RavelinReactNative alloc] init];
  }
  return self;
}

- (void)setUp:(NSString *)apiKey
   appVersion:(NSString *)appVersion
      resolve:(RCTPromiseResolveBlock)resolve
       reject:(RCTPromiseRejectBlock)reject {
  [_impl setUp:apiKey appVersion:appVersion resolve:resolve reject:reject];
}

- (void)getDeviceId:(RCTPromiseResolveBlock)resolve
             reject:(RCTPromiseRejectBlock)reject {
  [_impl getDeviceId:resolve reject:reject];
}

- (void)setCustomerId:(NSString *)customerId
              resolve:(RCTPromiseResolveBlock)resolve
               reject:(RCTPromiseRejectBlock)reject {
  [_impl setCustomerId:customerId resolve:resolve reject:reject];
}

- (void)setOrderId:(NSString *)orderId
           resolve:(RCTPromiseResolveBlock)resolve
            reject:(RCTPromiseRejectBlock)reject {
  [_impl setOrderId:orderId resolve:resolve reject:reject];
}

- (void)trackPage:(NSString *)pageTitle
             data:(NSDictionary *)data
          resolve:(RCTPromiseResolveBlock)resolve
           reject:(RCTPromiseRejectBlock)reject {
  [_impl trackPage:pageTitle data:data resolve:resolve reject:reject];
}

- (void)trackSearch:(NSString *)pageTitle
        searchValue:(NSString *)searchValue
            resolve:(RCTPromiseResolveBlock)resolve
             reject:(RCTPromiseRejectBlock)reject {
  [_impl trackSearch:pageTitle searchValue:searchValue resolve:resolve reject:reject];
}

- (void)trackSelectOption:(NSString *)pageTitle
                   option:(NSString *)option
              optionValue:(NSString *)optionValue
                  resolve:(RCTPromiseResolveBlock)resolve
                   reject:(RCTPromiseRejectBlock)reject {
  [_impl trackSelectOption:pageTitle option:option optionValue:optionValue resolve:resolve reject:reject];
}

- (void)trackAddToCart:(NSString *)pageTitle
              itemName:(NSString *)itemName
              quantity:(double)quantity
               resolve:(RCTPromiseResolveBlock)resolve
                reject:(RCTPromiseRejectBlock)reject {
  [_impl trackAddToCart:pageTitle itemName:itemName quantity:@(quantity) resolve:resolve reject:reject];
}

- (void)trackRemoveFromCart:(NSString *)pageTitle
                   itemName:(NSString *)itemName
                   quantity:(double)quantity
                    resolve:(RCTPromiseResolveBlock)resolve
                     reject:(RCTPromiseRejectBlock)reject {
  [_impl trackRemoveFromCart:pageTitle itemName:itemName quantity:@(quantity) resolve:resolve reject:reject];
}

- (void)trackAddToWishlist:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                   resolve:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject {
  [_impl trackAddToWishlist:pageTitle itemName:itemName resolve:resolve reject:reject];
}

- (void)trackRemoveFromWishlist:(NSString *)pageTitle
                       itemName:(NSString *)itemName
                        resolve:(RCTPromiseResolveBlock)resolve
                         reject:(RCTPromiseRejectBlock)reject {
  [_impl trackRemoveFromWishlist:pageTitle itemName:itemName resolve:resolve reject:reject];
}

- (void)trackLanguageChange:(NSString *)pageTitle
                   language:(NSString *)language
                    resolve:(RCTPromiseResolveBlock)resolve
                     reject:(RCTPromiseRejectBlock)reject {
  [_impl trackLanguageChange:pageTitle language:language resolve:resolve reject:reject];
}

- (void)trackCurrencyChange:(NSString *)pageTitle
                   currency:(NSString *)currency
                    resolve:(RCTPromiseResolveBlock)resolve
                     reject:(RCTPromiseRejectBlock)reject {
  [_impl trackCurrencyChange:pageTitle currency:currency resolve:resolve reject:reject];
}

- (void)trackViewContent:(NSString *)pageTitle
             contentType:(NSString *)contentType
                 resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject {
  [_impl trackViewContent:pageTitle contentType:contentType resolve:resolve reject:reject];
}

- (void)trackEvent:(NSString *)eventType
         pageTitle:(NSString *)pageTitle
              data:(NSDictionary *)data
           resolve:(RCTPromiseResolveBlock)resolve
            reject:(RCTPromiseRejectBlock)reject {
  [_impl trackEvent:eventType pageTitle:pageTitle data:data resolve:resolve reject:reject];
}

- (void)trackLogin:(NSString *)pageTitle
              data:(NSDictionary *)data
           resolve:(RCTPromiseResolveBlock)resolve
            reject:(RCTPromiseRejectBlock)reject {
  [_impl trackLogin:pageTitle data:data resolve:resolve reject:reject];
}

- (void)trackLogOut:(NSString *)pageTitle
               data:(NSDictionary *)data
            resolve:(RCTPromiseResolveBlock)resolve
             reject:(RCTPromiseRejectBlock)reject {
  [_impl trackLogOut:pageTitle data:data resolve:resolve reject:reject];
}

- (void)trackFingerprint:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject {
  [_impl trackFingerprint:resolve reject:reject];
}

- (void)trackPaste:(NSString *)pageTitle
       pastedValue:(NSString *)pastedValue
           resolve:(RCTPromiseResolveBlock)resolve
            reject:(RCTPromiseRejectBlock)reject {
  [_impl trackPaste:pageTitle pastedValue:pastedValue resolve:resolve reject:reject];
}

- (void)cleanup:(RCTPromiseResolveBlock)resolve
         reject:(RCTPromiseRejectBlock)reject {
  [_impl cleanup:resolve reject:reject];
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeRavelinCoreSpecJSI>(params);
}

+ (BOOL)requiresMainQueueSetup {
  return NO;
}

@end
