#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RavelinCore, NSObject)

RCT_EXTERN__BLOCKING_SYNCHRONOUS_METHOD(setUp:(NSString *)apiKey)
RCT_EXTERN__BLOCKING_SYNCHRONOUS_METHOD(getDeviceId)
RCT_EXTERN__BLOCKING_SYNCHRONOUS_METHOD(setCustomerId:(NSString *)customerId)
RCT_EXTERN__BLOCKING_SYNCHRONOUS_METHOD(setOrderId:(NSString *)orderId)
RCT_EXTERN_METHOD(
                trackFingerprint:(RCTPromiseResolveBlock)resolve
                reject:(RCTPromiseRejectBlock)reject
                )
RCT_EXTERN_METHOD(
                  trackPage:(NSString *)pageTitle
                  data:(NSDictionary *)data
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackSearch:(NSString *)pageTitle
                  searchValue:(NSString *)searchValue
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackSelectOption:(NSString *)pageTitle
                  option:(NSString *)option
                  optionValue:(NSString *)optionValue
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackAddToCart:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                  quantity:(NSNumber *)quantity
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackRemoveFromCart:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                  quantity:(NSNumber *)quantity
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackAddToWishlist:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackRemoveFromWishlist:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackLanguageChange:(NSString *)pageTitle
                  language:(NSString *)language
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackCurrencyChange:(NSString *)pageTitle
                  currency:(NSString *)currency
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackViewContent:(NSString *)pageTitle
                  contentType:(NSString *)contentType
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackEvent:(NSString *)eventType
                  pageTitle:(NSString *)pageTitle
                  data:(NSDictionary *)data
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackLogin:(NSString *)customerId
                  pageTitle:(NSString *)pageTitle
                  data:(NSDictionary *)data
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )
RCT_EXTERN_METHOD(
                  trackLogout:(NSString *)pageTitle
                  data:(NSDictionary *)data
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject
                  )

@end
