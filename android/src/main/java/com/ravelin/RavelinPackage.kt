package com.ravelin

import com.facebook.react.BaseReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.model.ReactModuleInfo
import com.facebook.react.module.model.ReactModuleInfoProvider

class RavelinPackage : BaseReactPackage() {
  override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? =
    if (name == RavelinModule.NAME) {
      RavelinModule(reactContext)
    } else {
      null
    }

  override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {
    mapOf(
      RavelinModule.NAME to ReactModuleInfo(
        RavelinModule.NAME,
        RavelinModule.NAME,
        false,
        false,
        false,
        true
      )
    )
  }
}
