import Foundation
import Network
import React
import RavelinCore

@objc(RavelinCore)
class RavelinCore: RCTEventEmitter {


    override init() {
        super.init()
    }

    @objc func setUp(_ apiKey: String, resolve: @escaping RCTPromiseResolveBlock, reject reject: @escaping RCTPromiseRejectBlock) -> Void {
            var ravelin = Ravelin.createInstance(apiKey)
            if (ravelin.deviceId != "") {
                resolve(true)
            } else {
                let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
                reject("instantiation_error", "Ravelin SDK could not be instantiatied", error)
            }
        }

    @objc func getDeviceId(_ resolve: @escaping RCTPromiseResolveBlock, reject reject: @escaping RCTPromiseRejectBlock) -> Void {
        var deviceId = Ravelin.sharedInstance().deviceId
        if (deviceId != ""){
            resolve(deviceId)
        } else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("device_id_not_available", "Device ID could not be fetched", error)
        }
    }

    @objc func setCustomerId(_ customerId: String, resolve: @escaping RCTPromiseResolveBlock, reject reject: @escaping RCTPromiseRejectBlock) -> Void {
        Ravelin.sharedInstance().customerId = customerId
        if (Ravelin.sharedInstance().customerId != "") {
            resolve(true)
        } else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("customer_id_error", "Ravelin SDK could save Customer ID", error)
        }
    }

    @objc func setOrderId(_ orderId: String, resolve: @escaping RCTPromiseResolveBlock, reject reject: @escaping RCTPromiseRejectBlock) -> Void {
        Ravelin.sharedInstance().orderId = orderId
        if (Ravelin.sharedInstance().orderId != "") {
            resolve(true)
        } else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("instantiation_error", "Ravelin SDK could not save Order ID", error)
        }
    }

    @objc func setOrderId(_ orderId: String) -> Void {
        Ravelin.sharedInstance().orderId = orderId
    }


    @objc func trackPage(_ pageTitle: String, data: [String:String],
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {
        Ravelin.sharedInstance().trackPage(pageTitle, eventProperties: data, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }


    @objc func trackSearch(_ pageTitle: String, searchValue: String,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {
        Ravelin.sharedInstance().trackSearch(pageTitle, searchValue: searchValue, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }

    @objc func trackSelectOption(_ pageTitle: String, option: String, optionValue: String,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {
        Ravelin.sharedInstance().trackSelectOption(pageTitle, option: option, optionValue: optionValue, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }


    @objc func trackAddToCart(_ pageTitle: String, itemName: String, quantity: NSNumber,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {
        Ravelin.sharedInstance().trackAddToCart(pageTitle: pageTitle, itemName: itemName, quantity: quantity, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }


    @objc func trackRemoveFromCart(_ pageTitle: String, itemName: String, quantity: NSNumber,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {
        Ravelin.sharedInstance().trackRemoveFromCart(pageTitle: pageTitle, itemName: itemName, quantity: quantity, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }

    @objc func trackAddToWishlist(_ pageTitle: String, itemName: String,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {
        Ravelin.sharedInstance().trackAddToWishlist(pageTitle: pageTitle, itemName: itemName, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }

    @objc func trackRemoveFromWishlist(_ pageTitle: String, itemName: String,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {
        Ravelin.sharedInstance().trackRemoveFromWishlist(pageTitle: pageTitle, itemName: itemName, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }


    @objc func trackLanguageChange(_ pageTitle: String, language: String,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {

        Ravelin.sharedInstance().track(pageTitle, eventName: "LANGUAGE_CHANGED", eventProperties: ["language":language], completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }

    @objc func trackCurrencyChange(_ pageTitle: String, currency: String,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {

        Ravelin.sharedInstance().track(pageTitle, eventName: "CURRENCY_CHANGED", eventProperties: ["currency":currency], completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }


    @objc func trackViewContent(_ pageTitle: String, contentType: String,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {

        Ravelin.sharedInstance().trackViewContent(pageTitle, contentType: contentType, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }


    @objc func trackEvent(_ eventType:String, pageTitle: String, data: [String:String],
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {

        Ravelin.sharedInstance().track(pageTitle, eventName: eventType, eventProperties: data, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }


    @objc func trackLogin(_ pageTitle: String, data: [String:String],
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {

        Ravelin.sharedInstance().trackLogin(pageTitle, eventProperties: data, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }

    @objc func trackLogOut(_ pageTitle: String, data: [String:String],
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock ) -> Void
    {

        Ravelin.sharedInstance().trackLogout(pageTitle, eventProperties: data, completionHandler: { data, response, error in
            if error != nil {
                reject("0", error?.localizedDescription, error)
            } else {
                resolve(data)
            }
        })
    }

    override static func requiresMainQueueSetup() -> Bool {
      return true
    }
}
