import Foundation
import Network
import React
import RavelinCore

@objc(RavelinCore)
class RavelinCore: RCTEventEmitter {


    override init() {
        super.init()
    }

    @objc func setUp(_ apiKey: String) -> Void {
        Ravelin.createInstance(apiKey)
    }

    @objc func getDeviceId(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        var deviceId = Ravelin.sharedInstance().deviceId 
        if (deviceId != ""){
            resolve(deviceId)
        } else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("device_id_not_available", "Device ID could not be fetched", error)
        }
    }

    @objc func setCustomerId(_ customerId: String) -> Void {
        Ravelin.sharedInstance().customerId = customerId
    }

    @objc func setOrderId(_ orderId: String) -> Void {
        Ravelin.sharedInstance().orderId = orderId
    }


    @objc func trackPage(_ pageTitle: String, data: [String:String]) -> Void
    {
        Ravelin.sharedInstance().trackPage(pageTitle, eventProperties: data)
    }


    @objc func trackSearch(_ pageTitle: String, searchValue: String) -> Void
    {
        Ravelin.sharedInstance().trackSearch(pageTitle, searchValue: searchValue)
    }

    @objc func trackSelectOption(_ pageTitle: String, option: String, optionValue: String) -> Void
    {
        Ravelin.sharedInstance().trackSelectOption(pageTitle, option: option, optionValue: optionValue)
    }


    @objc func trackAddToCart(_ pageTitle: String, itemName: String, quantity: NSNumber) -> Void
    {
        Ravelin.sharedInstance().trackAddToCart(pageTitle: pageTitle, itemName: itemName, quantity: quantity)
    }


    @objc func trackRemoveFromCart(_ pageTitle: String, itemName: String, quantity: NSNumber) -> Void
    {
        Ravelin.sharedInstance().trackRemoveFromCart(pageTitle: pageTitle, itemName: itemName, quantity: quantity)
    }

    @objc func trackAddToWishlist(_ pageTitle: String, itemName: String) -> Void
    {
        Ravelin.sharedInstance().trackAddToWishlist(pageTitle: pageTitle, itemName: itemName)
    }

    @objc func trackRemoveFromWishlist(_ pageTitle: String, itemName: String) -> Void
    {
        Ravelin.sharedInstance().trackRemoveFromWishlist(pageTitle: pageTitle, itemName: itemName)
    }


    @objc func trackLanguageChange(_ pageTitle: String, language: String) -> Void
    {

        Ravelin.sharedInstance().track(pageTitle, eventName: "LANGUAGE_CHANGED", eventProperties: ["language":language])
    }

    @objc func trackCurrencyChange(_ pageTitle: String, currency: String) -> Void
    {

        Ravelin.sharedInstance().track(pageTitle, eventName: "CURRENCY_CHANGED", eventProperties: ["currency":currency])
    }


    @objc func trackViewContent(_ pageTitle: String, contentType: String) -> Void
    {

        Ravelin.sharedInstance().trackViewContent(pageTitle, contentType: contentType)
    }


    @objc func trackEvent(_ eventType:String, pageTitle: String, data: [String:String] ) -> Void
    {

        Ravelin.sharedInstance().track(pageTitle, eventName: eventType, eventProperties: data)
    }


    @objc func trackLogin(_ pageTitle: String, data: [String:String]) -> Void
    {

        Ravelin.sharedInstance().trackLogin(pageTitle, eventProperties: data)
    }

    @objc func trackLogout(_ pageTitle: String, data: [String:String]) -> Void
    {

        Ravelin.sharedInstance().trackLogout(pageTitle, eventProperties: data)
    }

    override static func requiresMainQueueSetup() -> Bool {
      return true
    }
}
