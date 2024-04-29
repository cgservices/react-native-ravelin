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

class RavelinModule(reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "RavelinCore"
    }

    @ReactMethod()
    fun setUp(apiKey: String) {
        currentActivity?.let {
          val ravelin: RavelinSDK? = RavelinSDK.createInstance(it.application, apiKey, object : RavelinCallback<RavelinSDK>() {

            override fun success(ravelin: RavelinSDK?) {
              Log.d("Ravelin SDK Setup", "Success")
            }

            override fun failure(error: RavelinError) {
              Log.e("Ravelin SDK Setup Error", error.message!!)
            }
          })
        }

    }

    @ReactMethod()
    fun getDeviceId(promise: Promise) {
        val ravelinSdk = RavelinSDK.getSharedInstance()
        promise.resolve(ravelinSdk!!.deviceId)
    }

    @ReactMethod
    fun setCustomerId(customerId: String) {
        RavelinSDK.getSharedInstance()!!.customerId = customerId
        return
    }

    @ReactMethod
    fun setOrderId(orderId: String) {
        RavelinSDK.getSharedInstance()!!.orderId = orderId
        return
    }

    @ReactMethod
    fun trackPage(pageTitle: String, data: ReadableMap) {
        RavelinSDK.getSharedInstance()!!.trackPage(
            pageTitle,
            Properties(data.toHashMap())
        )
    }

    @ReactMethod
    fun trackSearch(pageTitle: String, searchValue: String) {
        RavelinSDK.getSharedInstance()!!.trackSearch(
            pageTitle,
            searchValue
        )
    }

    @ReactMethod
    fun trackSelectOption(
        pageTitle: String,
        option: String,
        optionValue: String
    ) {
        RavelinSDK.getSharedInstance()!!.trackSelectOption(
            pageTitle,
            option,
            optionValue
        )
    }

    @ReactMethod
    fun trackAddToCart(pageTitle: String, itemName: String, quantity: Int) {
        RavelinSDK.getSharedInstance()!!.trackAddToCart(
            pageTitle,
            itemName,
            quantity
        )
    }

    @ReactMethod
    fun trackRemoveFromCart(pageTitle: String, itemName: String, quantity: Int) {
        RavelinSDK.getSharedInstance()!!.trackRemoveFromCart(
            pageTitle,
            itemName,
            quantity
        )
    }

    @ReactMethod
    fun trackAddToWishlist(pageTitle: String, itemName: String) {
        RavelinSDK.getSharedInstance()
            ?.trackAddToWishlist(pageTitle, itemName)
    }

    @ReactMethod
    fun trackRemoveFromWishlist(pageTitle: String, itemName: String) {
        RavelinSDK.getSharedInstance()!!.trackRemoveFromWishlist(
            pageTitle,
            itemName
        )
    }

    @ReactMethod
    fun trackLanguageChange(pageTitle: String, language: String) {
        RavelinSDK.getSharedInstance()!!.trackLanguageChange(
            pageTitle,
            language
        )
    }

    @ReactMethod
    fun trackCurrencyChange(pageTitle: String, currency: String) {
        RavelinSDK.getSharedInstance()!!.trackCurrencyChange(
            pageTitle,
            currency
        )
    }

    @ReactMethod
    fun trackViewContent(pageTitle: String, contentType: String) {
        RavelinSDK.getSharedInstance()!!.trackViewContent(
            pageTitle,
            contentType
        )
    }

    @ReactMethod
    fun trackEvent(eventType: String, pageTitle: String, data: ReadableMap) {
        RavelinSDK.getSharedInstance()!!.trackEvent(
            eventType,
            pageTitle,
            Properties(data.toHashMap())
        )
    }

    @ReactMethod
    fun trackLogin(customerId: String, pageTitle: String, data: ReadableMap) {
        RavelinSDK.getSharedInstance()!!.trackLogIn(
            customerId,
            pageTitle,
            Properties(data.toHashMap())
        )
    }

    @ReactMethod
    fun trackLogOut(pageTitle: String, data: ReadableMap) {
        RavelinSDK.getSharedInstance()!!.trackLogOut(
            pageTitle,
            Properties(data.toHashMap())
        )
    }

    @ReactMethod
    fun trackPaste(pageTitle: String, value: String) {
        RavelinSDK.getSharedInstance()
            ?.trackPaste(pageTitle, value)
    }
}
