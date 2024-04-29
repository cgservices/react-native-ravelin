import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-ravelin' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

// eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
const Ravelin =
  NativeModules.RavelinCore ??
  new Proxy(
    {},
    {
      get() {
        throw new Error(LINKING_ERROR);
      },
    }
  );

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

export default Ravelin as RavelinModuleInterface;
