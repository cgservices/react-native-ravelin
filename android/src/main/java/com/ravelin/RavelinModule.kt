package com.ravelin

import android.app.Application
import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReadableMap
import com.ravelin.core.RavelinSDK
import com.ravelin.core.callback.RavelinCallback
import com.ravelin.core.callback.RavelinRequestCallback
import com.ravelin.core.model.RavelinError
import com.ravelin.core.util.typealiasses.Properties

class RavelinRequestCallbackPromiseWrapper(promise: Promise) : RavelinRequestCallback() {
  private val promise = promise

  override fun success() {
    promise.resolve(true)
  }

  override fun failure(error: RavelinError) {
    promise.reject(Error(error.message))
  }
}

class RavelinModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return "RavelinCore"
  }

  @ReactMethod
  fun setUp(apiKey: String, appVersion: String, promise: Promise) {
    currentActivity?.let {
      RavelinSDK.createInstance(it.application, apiKey, appVersion, null, object : RavelinCallback<RavelinSDK>() {

        override fun success(result: RavelinSDK?) {
          Log.d("Ravelin SDK Setup", "Success")
          promise.resolve(true)
        }

        override fun failure(error: RavelinError) {
          Log.e("Ravelin SDK Setup Error", error.message!!)
          promise.resolve(false)
        }
      })
    }

  }

  @ReactMethod
  fun getDeviceId(promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    promise.resolve(ravelinSdk!!.deviceId)
  }

  @ReactMethod
  fun setCustomerId(customerId: String, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.customerId = customerId
    promise.resolve(true)
  }

  @ReactMethod
  fun setOrderId(orderId: String, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.orderId = orderId
    promise.resolve(true)
  }

  @ReactMethod
  fun trackPage(pageTitle: String, data: ReadableMap, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackPage(
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackSearch(pageTitle: String, searchValue: String, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackSearch(
      pageTitle,
      searchValue,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackSelectOption(
    pageTitle: String,
    option: String,
    optionValue: String,
    promise: Promise
  ) {
    RavelinSDK.getSharedInstance()!!.trackSelectOption(
      pageTitle,
      option,
      optionValue,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackAddToCart(pageTitle: String, itemName: String, quantity: Int, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackAddToCart(
      pageTitle,
      itemName,
      quantity,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackRemoveFromCart(pageTitle: String, itemName: String, quantity: Int, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackRemoveFromCart(
      pageTitle,
      itemName,
      quantity,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackAddToWishlist(pageTitle: String, itemName: String, promise: Promise) {
    RavelinSDK.getSharedInstance()
      ?.trackAddToWishlist(pageTitle, itemName, RavelinRequestCallbackPromiseWrapper(promise))
  }

  @ReactMethod
  fun trackRemoveFromWishlist(pageTitle: String, itemName: String, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackRemoveFromWishlist(
      pageTitle,
      itemName,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackLanguageChange(pageTitle: String, language: String, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackLanguageChange(
      pageTitle,
      language,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackCurrencyChange(pageTitle: String, currency: String, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackCurrencyChange(
      pageTitle,
      currency,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackViewContent(pageTitle: String, contentType: String, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackViewContent(
      pageTitle,
      contentType,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackEvent(eventType: String, pageTitle: String, data: ReadableMap, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackEvent(
      eventType,
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackLogin(customerId: String, pageTitle: String, data: ReadableMap, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackLogIn(
      customerId,
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackLogOut(pageTitle: String, data: ReadableMap, promise: Promise) {
    RavelinSDK.getSharedInstance()!!.trackLogOut(
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackFingerprint(promise: Promise) {
      val ravelin = RavelinSDK.getSharedInstance()
      ravelin!!.trackFingerprint(RavelinRequestCallbackPromiseWrapper(promise))
  }

  @ReactMethod
  fun trackPaste(pageTitle: String, value: String, promise: Promise) {
    RavelinSDK.getSharedInstance()
      ?.trackPaste(pageTitle, value, RavelinRequestCallbackPromiseWrapper(promise))
  }

  @ReactMethod
  fun cleanup(promise: Promise) {
    RavelinSDK.cleanup(object : RavelinCallback<String>() {
      override fun success(result: String?) {
        Log.d("Ravelin SDK Cleanup", result)
        promise.resolve(true)
      }

      override fun failure(error: RavelinError) {
        Log.e("Ravelin SDK Cleanup Error", error.message!!)
        promise.resolve(false)
      }
    })
  }
}
