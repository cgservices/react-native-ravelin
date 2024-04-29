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

## Usage

```js
const { RavelinCore: Ravelin } = require('react-native-ravelin');

...
  await Ravelin.setUp(API_KEY)
  Ravelin.setCustomerId(USER.id)
  const deviceId = await Ravelin.getDeviceId()
  await Ravelin.trackPage('Login', { any: 'additional data' })
  await Ravelin.trackLogin(USER.email || SOME_UNIQUE_ID, 'Login', { any: 'additional data' })
  await Ravelin.trackLogout('Logout', { any: 'additional data' })

```

## Ravelin Interface

The various handlers the SDK provides are the ones listed in this interface here...

```js
interface RavelinModuleInterface {
  setUp: (apiKey: string) => Promise<Boolean>;
  getDeviceId: () => Promise<string>;
  setCustomerId: (customerId: string) => Promise<Boolean>;
  setOrderId: (orderId: string) => Promise<Boolean>;
  trackPage: (pageTitle: string, data: Record<string, string>) => Promise<void>;
  trackSearch: (pageTitle: string, searchValue: string) => Promise<void>;
  trackSelectOption: (
    pageTitle: string,
    option: string,
    optionValue: string
  ) => Promise<void>;
  trackAddToCart: (
    pageTitle: string,
    itemName: string,
    quantity: number
  ) => Promise<void>;
  trackRemoveFromCart: (
    pageTitle: string,
    itemName: string,
    quantity: number
  ) => Promise<void>;
  trackAddToWishlist: (pageTitle: string, itemName: string) => Promise<void>;
  trackRemoveFromWishlist: (
    pageTitle: string,
    itemName: string
  ) => Promise<void>;
  trackLanguageChange: (pageTitle: string, language: string) => Promise<void>;
  trackCurrencyChange: (pageTitle: string, currency: string) => Promise<void>;
  trackViewContent: (pageTitle: string, contentType: string) => Promise<void>;
  trackEvent: (
    eventType: string,
    pageTitle: string,
    data: Record<string, string>
  ) => Promise<void>;
  trackLogin: (
    customerId: string,
    pageTitle: string,
    data: Record<string, string>
  ) => Promise<void>;
  trackLogout: (
    pageTitle: string,
    data: Record<string, string>
  ) => Promise<void>;
}
---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
