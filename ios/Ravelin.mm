#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RavelinCore, NSObject)

RCT_EXTERN_METHOD(setUp:(NSString *)apiKey)
RCT_EXTERN_METHOD(
                  getDeviceId:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject
)
RCT_EXTERN_METHOD(setCustomerId:(NSString *)customerId)
RCT_EXTERN_METHOD(setOrderId:(NSString *)orderId)
RCT_EXTERN_METHOD(
                  trackPage:(NSString *)pageTitle
                  data:(NSDictionary *)data
                  )
RCT_EXTERN_METHOD(
                  trackSearch:(NSString *)pageTitle
                  searchValue:(NSString *)searchValue
                  )
RCT_EXTERN_METHOD(
                  trackSelectOption:(NSString *)pageTitle
                  option:(NSString *)option
                  optionValue:(NSString *)optionValue
                  )
RCT_EXTERN_METHOD(
                  trackAddToCart:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                  quantity:(NSNumber *)quantity
                  )
RCT_EXTERN_METHOD(
                  trackRemoveFromCart:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                  quantity:(NSNumber *)quantity
                  )
RCT_EXTERN_METHOD(
                  trackAddToWishlist:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                  )
RCT_EXTERN_METHOD(
                  trackRemoveFromWishlist:(NSString *)pageTitle
                  itemName:(NSString *)itemName
                  )
RCT_EXTERN_METHOD(
                  trackLanguageChange:(NSString *)pageTitle
                  language:(NSString *)language
                  )
RCT_EXTERN_METHOD(
                  trackCurrencyChange:(NSString *)pageTitle
                  currency:(NSString *)currency
                  )
RCT_EXTERN_METHOD(
                  trackViewContent:(NSString *)pageTitle
                  contentType:(NSString *)contentType
                  )
RCT_EXTERN_METHOD(
                  trackEvent:(NSString *)eventType
                  pageTitle:(NSString *)pageTitle
                  data:(NSDictionary *)data
                  )
RCT_EXTERN_METHOD(
                  trackLogin:(NSString *)customerId
                  pageTitle:(NSString *)pageTitle
                  data:(NSDictionary *)data
                  )
RCT_EXTERN_METHOD(
                  trackLogout:(NSString *)pageTitle
                  data:(NSDictionary *)data
                  )

@end
