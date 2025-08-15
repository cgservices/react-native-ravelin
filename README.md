# react-native-ravelin

React Native Ravelin SDK

## Installation

```sh
npm install react-native-ravelin
```
or 
```
yarn add react-native-ravelin
```

## Additional setup

### Android

In your app's build.gradle add the following
```
  android {
    ...
    compileOptions {
        ...
        coreLibraryDesugaringEnabled true
    }
  }

  allprojects {
    repositories {
        /* other repositories */
        maven {
            setUrl("https://maven.ravelin.com/public/repositories/core-android/")
        }
    }
  }

  dependencies {
    ...
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
  }
```

Since RN projects that support proguard rules do not inherently use a R8 compiler for obfuscation, you need to add some proguard rules to your `proguard-rules.pro` file in your android project
Documentation can be found here:
- https://developer.ravelin.com/merchant/libraries-and-sdks/android/core-sdk/android/#proguard-rules
Rules to be added:
- https://developer.ravelin.com/merchant/libraries-and-sdks/android/core-sdk/proguard-rules-core/

### iOS

Add the following at the top of your Podfile:
```
source 'https://cdn.cocoapods.org/'
source 'https://github.com/unravelin/Specs.git'
```

## Usage

```js
const { RavelinCore: Ravelin } = require('react-native-ravelin');

...
  await Ravelin.setUp(API_KEY)
  await Ravelin.setCustomerId(USER.id)
  // must be called immediately after setup and setting customer ID to register device info
  await Ravelin.trackFingerprint()
  const deviceId = await Ravelin.getDeviceId()
  await Ravelin.trackPage('Login', { any: 'additional data' })
  await Ravelin.trackLogin(USER.email || SOME_UNIQUE_ID, 'Login', { any: 'additional data' })
  await Ravelin.trackLogOut('Logout', { any: 'additional data' })

```

## Ravelin Interface

The various handlers the SDK provides are the ones listed in this interface here...

```ts
interface RavelinModuleInterface {
  setUp: (apiKey: string, appVersion: string) => Promise<boolean>;
  getDeviceId: () => Promise<string>;
  setCustomerId: (customerId: string) => Promise<boolean>;
  setOrderId: (orderId: string) => Promise<boolean>;
  trackPage: (
    pageTitle: string,
    data: Record<string, string>
  ) => Promise<boolean>;
  trackSearch: (pageTitle: string, searchValue: string) => Promise<boolean>;
  trackSelectOption: (
    pageTitle: string,
    option: string,
    optionValue: string
  ) => Promise<boolean>;
  trackAddToCart: (
    pageTitle: string,
    itemName: string,
    quantity: number
  ) => Promise<boolean>;
  trackRemoveFromCart: (
    pageTitle: string,
    itemName: string,
    quantity: number
  ) => Promise<boolean>;
  trackAddToWishlist: (pageTitle: string, itemName: string) => Promise<boolean>;
  trackRemoveFromWishlist: (
    pageTitle: string,
    itemName: string
  ) => Promise<boolean>;
  trackLanguageChange: (
    pageTitle: string,
    language: string
  ) => Promise<boolean>;
  trackCurrencyChange: (
    pageTitle: string,
    currency: string
  ) => Promise<boolean>;
  trackViewContent: (
    pageTitle: string,
    contentType: string
  ) => Promise<boolean>;
  trackEvent: (
    eventType: string,
    pageTitle: string,
    data: Record<string, string>
  ) => Promise<boolean>;
  trackLogin: (
    customerId: string,
    pageTitle: string,
    data: Record<string, string>
  ) => Promise<boolean>;
  trackLogOut: (
    pageTitle: string,
    data: Record<string, string>
  ) => Promise<boolean>;
  trackFingerprint: () => Promise<boolean>;
  trackPaste: () => Promise<boolean>;
}
---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
