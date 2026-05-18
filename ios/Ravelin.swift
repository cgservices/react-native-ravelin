import Foundation
import React
import RavelinCore

@objc(RavelinCore)
class RavelinReactNative: NSObject {

    @objc func configure(_ apiKey: String, appVersion: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
        Ravelin.shared.configure(apiKey: apiKey, customerId: nil, appVersion: appVersion) { result in
            switch result {
            case .success:
                resolve(nil)
            case .failure(let error):
                reject("instantiation_error", "Ravelin SDK could not be instantiated", error as NSError)
            }
        }
    }

    @objc func getDeviceId(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        let deviceId = Ravelin.shared.deviceId
        if let deviceId = deviceId, !deviceId.isEmpty {
            resolve(deviceId)
        } else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("device_id_not_available", "Device ID could not be fetched", error)
        }
    }

    @objc func setCustomerId(_ customerId: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.customerId = customerId
        resolve(nil)
    }

    @objc func setOrderId(_ orderId: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.orderId = orderId
        resolve(nil)
    }

    @objc func trackPage(_ pageTitle: String, data: [String: Any],
                         resolve: @escaping RCTPromiseResolveBlock,
                         reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackPage(pageTitle, eventProperties: data) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackSearch(_ pageTitle: String, searchValue: String,
                           resolve: @escaping RCTPromiseResolveBlock,
                           reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackSearch(pageTitle, searchValue: searchValue) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackSelectOption(_ pageTitle: String, option: String, optionValue: String,
                                 resolve: @escaping RCTPromiseResolveBlock,
                                 reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackSelectOption(pageTitle, option: option, optionValue: optionValue) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackAddToCart(_ pageTitle: String, itemName: String, quantity: NSNumber,
                              resolve: @escaping RCTPromiseResolveBlock,
                              reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackAddToCart(pageTitle, itemName: itemName, quantity: quantity) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackRemoveFromCart(_ pageTitle: String, itemName: String, quantity: NSNumber,
                                   resolve: @escaping RCTPromiseResolveBlock,
                                   reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackRemoveFromCart(pageTitle, itemName: itemName, quantity: quantity) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackAddToWishlist(_ pageTitle: String, itemName: String,
                                  resolve: @escaping RCTPromiseResolveBlock,
                                  reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackAddToWishlist(pageTitle, itemName: itemName) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackRemoveFromWishlist(_ pageTitle: String, itemName: String,
                                       resolve: @escaping RCTPromiseResolveBlock,
                                       reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackRemoveFromWishlist(pageTitle, itemName: itemName) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackLanguageChange(_ pageTitle: String, language: String,
                                   resolve: @escaping RCTPromiseResolveBlock,
                                   reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackLanguageChange(pageTitle, language: language) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackCurrencyChange(_ pageTitle: String, currency: String,
                                   resolve: @escaping RCTPromiseResolveBlock,
                                   reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackCurrencyChange(pageTitle, currency: currency) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackViewContent(_ pageTitle: String, contentType: String,
                                resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackViewContent(pageTitle, contentType: contentType) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackEvent(_ eventType: String, pageTitle: String, data: [String: Any],
                          resolve: @escaping RCTPromiseResolveBlock,
                          reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.track(pageTitle, eventName: eventType, eventProperties: data) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackLogin(_ pageTitle: String, data: [String: Any],
                          resolve: @escaping RCTPromiseResolveBlock,
                          reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackLogin(pageTitle, eventProperties: data) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackFingerprint(_ resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackFingerprint(nil) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackLogOut(_ pageTitle: String, data: [String: Any],
                           resolve: @escaping RCTPromiseResolveBlock,
                           reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackLogout(pageTitle, eventProperties: data) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func trackPaste(_ pageTitle: String, pastedValue: String,
                          resolve: @escaping RCTPromiseResolveBlock,
                          reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard Ravelin.shared.apiKey != nil else {
            let error = NSError(domain: "RavelinCore", code: -1, userInfo: nil)
            reject("not_configured", "Ravelin SDK has not been configured", error)
            return
        }
        Ravelin.shared.trackPaste(pageTitle, pastedValue: pastedValue) { _, _, error in
            if let error = error {
                reject("track_error", error.localizedDescription, error)
            } else {
                resolve(nil)
            }
        }
    }

    @objc func cleanup(_ resolve: @escaping RCTPromiseResolveBlock,
                       reject: @escaping RCTPromiseRejectBlock) -> Void {
        resolve(nil)
    }

    @objc static func requiresMainQueueSetup() -> Bool {
        return false
    }
}
