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
          Log.d("RNRavelin", "Success")
          promise.resolve(true)
        }

        override fun failure(error: RavelinError) {
          Log.e("RNRavelin", error.message!!)
          promise.reject(Error(error.message))
        }
      })
    }

  }

  @ReactMethod
  fun getDeviceId(promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
  }

  @ReactMethod
  fun setCustomerId(customerId: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.customerId = customerId
    promise.resolve(true)
  }

  @ReactMethod
  fun setOrderId(orderId: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.orderId = orderId
    promise.resolve(true)
  }

  @ReactMethod
  fun trackPage(pageTitle: String, data: ReadableMap, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackPage(
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackSearch(pageTitle: String, searchValue: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackSearch(
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
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackSelectOption(
      pageTitle,
      option,
      optionValue,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackAddToCart(pageTitle: String, itemName: String, quantity: Int, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackAddToCart(
      pageTitle,
      itemName,
      quantity,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackRemoveFromCart(pageTitle: String, itemName: String, quantity: Int, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackRemoveFromCart(
      pageTitle,
      itemName,
      quantity,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackAddToWishlist(pageTitle: String, itemName: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackAddToWishlist(pageTitle, itemName, RavelinRequestCallbackPromiseWrapper(promise))
  }

  @ReactMethod
  fun trackRemoveFromWishlist(pageTitle: String, itemName: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackRemoveFromWishlist(
      pageTitle,
      itemName,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackLanguageChange(pageTitle: String, language: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackLanguageChange(
      pageTitle,
      language,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackCurrencyChange(pageTitle: String, currency: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackCurrencyChange(
      pageTitle,
      currency,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackViewContent(pageTitle: String, contentType: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackViewContent(
      pageTitle,
      contentType,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackEvent(eventType: String, pageTitle: String, data: ReadableMap, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackEvent(
      eventType,
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackLogin(customerId: String, pageTitle: String, data: ReadableMap, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackLogIn(
      customerId,
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackLogOut(pageTitle: String, data: ReadableMap, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackLogOut(
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  @ReactMethod
  fun trackFingerprint(promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackFingerprint(RavelinRequestCallbackPromiseWrapper(promise))
  }

  @ReactMethod
  fun trackPaste(pageTitle: String, value: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject(Error("Failed to retrieve Instance"))
    }
    promise.resolve(ravelinSdk.deviceId)
    ravelinSdk.trackPaste(pageTitle, value, RavelinRequestCallbackPromiseWrapper(promise))
  }

  @ReactMethod
  fun cleanup(promise: Promise) {
    RavelinSDK.cleanup(object : RavelinCallback<String>() {
      override fun success(result: String?) {
        Log.d("RNRavelin", result?: "Success")
        promise.resolve(true)
      }

      override fun failure(error: RavelinError) {
        Log.e("RNRavelin", error.message!!)
        promise.resolve(false)
      }
    })
  }
}
