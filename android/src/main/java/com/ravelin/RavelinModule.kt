package com.ravelin

import android.app.Application
import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReadableMap
import com.ravelin.core.RavelinSDK
import com.ravelin.core.callback.RavelinCallback
import com.ravelin.core.callback.RavelinRequestCallback
import com.ravelin.core.model.RavelinError
import com.ravelin.core.model.ResponsePayload
import com.ravelin.core.util.typealiasses.Properties

class RavelinRequestCallbackPromiseWrapper(private val promise: Promise) : RavelinRequestCallback() {

  override fun success(payload: Array<ResponsePayload>?) {
    promise.resolve(null)
  }

  override fun failure(error: RavelinError) {
    promise.reject("ravelin_error", error.message ?: "Unknown error", null as Throwable?)
  }
}

class RavelinModule(reactContext: ReactApplicationContext) :
  NativeRavelinCoreSpec(reactContext) {

  override fun getName(): String = NAME

  companion object {
    const val NAME = "RavelinCore"
  }

  override fun configure(apiKey: String, appVersion: String, promise: Promise) {
    val application = reactApplicationContext.applicationContext as Application
    RavelinSDK.createInstance(
      application = application,
      apiKey = apiKey,
      appVersion = appVersion,
      callback = object : RavelinCallback<RavelinSDK>() {
        override fun success(result: RavelinSDK?) {
          promise.resolve(null)
        }

        override fun failure(error: RavelinError) {
          val message = error.message ?: "Unknown error"
          Log.e("RNRavelin", message)
          promise.reject("instantiation_error", message, null as Throwable?)
        }
      }
    )
  }

  override fun getDeviceId(promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    promise.resolve(ravelinSdk.deviceId)
  }

  override fun setCustomerId(customerId: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.customerId = customerId
    promise.resolve(null)
  }

  override fun setOrderId(orderId: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.orderId = orderId
    promise.resolve(null)
  }

  override fun trackPage(pageTitle: String, data: ReadableMap, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackPage(
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackSearch(pageTitle: String, searchValue: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackSearch(
      pageTitle,
      searchValue,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackSelectOption(
    pageTitle: String,
    option: String,
    optionValue: String,
    promise: Promise
  ) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackSelectOption(
      pageTitle,
      option,
      optionValue,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackAddToCart(pageTitle: String, itemName: String, quantity: Double, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackAddToCart(
      pageTitle,
      itemName,
      quantity.toInt(),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackRemoveFromCart(pageTitle: String, itemName: String, quantity: Double, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackRemoveFromCart(
      pageTitle,
      itemName,
      quantity.toInt(),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackAddToWishlist(pageTitle: String, itemName: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackAddToWishlist(
      pageTitle,
      itemName,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackRemoveFromWishlist(pageTitle: String, itemName: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackRemoveFromWishlist(
      pageTitle,
      itemName,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackLanguageChange(pageTitle: String, language: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackLanguageChange(
      pageTitle,
      language,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackCurrencyChange(pageTitle: String, currency: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackCurrencyChange(
      pageTitle,
      currency,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackViewContent(pageTitle: String, contentType: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackViewContent(
      pageTitle,
      contentType,
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackEvent(eventType: String, pageTitle: String, data: ReadableMap, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackEvent(
      eventType,
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackLogin(pageTitle: String, data: ReadableMap, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackLogIn(
      ravelinSdk.customerId,
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackLogOut(pageTitle: String, data: ReadableMap, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackLogOut(
      pageTitle,
      Properties(data.toHashMap()),
      RavelinRequestCallbackPromiseWrapper(promise)
    )
  }

  override fun trackFingerprint(promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackFingerprint(RavelinRequestCallbackPromiseWrapper(promise))
  }

  override fun trackPaste(pageTitle: String, pastedValue: String, promise: Promise) {
    val ravelinSdk = RavelinSDK.getSharedInstance()
    if (ravelinSdk == null) {
      promise.reject("not_configured", "Ravelin SDK has not been configured", null as Throwable?)
      return
    }
    ravelinSdk.trackPaste(pageTitle, pastedValue, RavelinRequestCallbackPromiseWrapper(promise))
  }

  override fun cleanup(promise: Promise) {
    RavelinSDK.cleanup(object : RavelinCallback<String>() {
      override fun success(result: String?) {
        promise.resolve(null)
      }

      override fun failure(error: RavelinError) {
        val message = error.message ?: "Unknown error"
        Log.e("RNRavelin", message)
        promise.reject("cleanup_error", message, null as Throwable?)
      }
    })
  }
}
