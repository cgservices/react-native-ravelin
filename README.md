# react-native-ravelin

Ravelin Mobile SDK wrapper for React Native

## Disclaimer

This software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages, or other liability, whether in an action of contract, tort, or otherwise, arising from, out of, or in connection with the software or the use or other dealings in the software.

## Installation

```sh
npm install @cgservices/react-native-ravelin
```

or

```sh
yarn add @cgservices/react-native-ravelin
```

## Additional setup

### Android

In your app's build.gradle add the following:

```groovy
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

### iOS

Add the following at the top of your Podfile:

```ruby
source 'https://cdn.cocoapods.org/'
source 'https://github.com/unravelin/Specs.git'
```

## Usage

```js
import Ravelin from 'react-native-ravelin';

await Ravelin.configure(API_KEY, APP_VERSION);
await Ravelin.setCustomerId(USER.id);
// Must be called immediately after setup and setting customer ID to register device info
await Ravelin.trackFingerprint();
const deviceId = await Ravelin.getDeviceId();
await Ravelin.trackPage('Login', { any: 'additional data' });
await Ravelin.trackLogin('Login', { any: 'additional data' });
await Ravelin.trackLogOut('Logout', { any: 'additional data' });
```

## Available methods

The various handlers the SDK provides are the ones listed in this interface here:

```ts
configure(apiKey: string, appVersion: string): Promise<void>
getDeviceId(): Promise<string>
setCustomerId(customerId: string): Promise<void>
setOrderId(orderId: string): Promise<void>
trackPage(pageTitle: string, data: Record<string, unknown>): Promise<void>
trackSearch(pageTitle: string, searchValue: string): Promise<void>
trackSelectOption(pageTitle: string, option: string, optionValue: string): Promise<void>
trackAddToCart(pageTitle: string, itemName: string, quantity: number): Promise<void>
trackRemoveFromCart(pageTitle: string, itemName: string, quantity: number): Promise<void>
trackAddToWishlist(pageTitle: string, itemName: string): Promise<void>
trackRemoveFromWishlist(pageTitle: string, itemName: string): Promise<void>
trackLanguageChange(pageTitle: string, language: string): Promise<void>
trackCurrencyChange(pageTitle: string, currency: string): Promise<void>
trackViewContent(pageTitle: string, contentType: string): Promise<void>
trackEvent(eventType: string, pageTitle: string, data: Record<string, unknown>): Promise<void>
trackLogin(pageTitle: string, data: Record<string, unknown>): Promise<void>
trackLogOut(pageTitle: string, data: Record<string, unknown>): Promise<void>
trackFingerprint(): Promise<void>
trackPaste(pageTitle: string, pastedValue: string): Promise<void>
cleanup(): Promise<void>
```

---

## License

MIT
