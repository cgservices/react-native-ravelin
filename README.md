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
  setUp: (apiKey: string) => Promise<boolean>;
  getDeviceId: () => Promise<string>;
  setCustomerId: (customerId: string) => void;
  setOrderId: (orderId: string) => void;
  trackFingerprint: () => Promise<boolean>;
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
  trackLogout: (
    pageTitle: string,
    data: Record<string, string>
  ) => Promise<boolean>;
}
---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
