import { NativeModules } from 'react-native';

const { RavelinCore: RavelinNative } = NativeModules;

if (!RavelinNative) {
  throw new Error(
    'react-native-ravelin: NativeModule "RavelinCore" is null. ' +
      'Ensure the library is correctly linked.'
  );
}

export interface RavelinModuleInterface {
  setUp: (apiKey: string, appVersion: string) => Promise<void>;
  getDeviceId: () => Promise<string>;
  setCustomerId: (customerId: string) => Promise<void>;
  setOrderId: (orderId: string) => Promise<void>;
  trackPage: (
    pageTitle: string,
    data: Record<string, unknown>
  ) => Promise<void>;
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
    data: Record<string, unknown>
  ) => Promise<void>;
  trackLogin: (
    pageTitle: string,
    data: Record<string, unknown>
  ) => Promise<void>;
  trackLogOut: (
    pageTitle: string,
    data: Record<string, unknown>
  ) => Promise<void>;
  trackFingerprint: () => Promise<void>;
  trackPaste: (pageTitle: string, pastedValue: string) => Promise<void>;
  cleanup?: () => Promise<void>;
}

export default RavelinNative;
