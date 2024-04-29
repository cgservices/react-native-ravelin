import { NativeModules } from 'react-native';
const { RavelinCore: Ravelin } = NativeModules;

interface RavelinModuleInterface {
  setUp: (apiKey: string) => void;
  getDeviceId: () => Promise<string>;
  setCustomerId: (customerId: string) => void;
  setOrderId: (orderId: string) => void;
  trackPage: (pageTitle: string, data: Record<string, string>) => void;
  trackSearch: (pageTitle: string, searchValue: string) => void;
  trackSelectOption: (
    pageTitle: string,
    option: string,
    optionValue: string
  ) => void;
  trackAddToCart: (
    pageTitle: string,
    itemName: string,
    quantity: number
  ) => void;
  trackRemoveFromCart: (
    pageTitle: string,
    itemName: string,
    quantity: number
  ) => void;
  trackAddToWishlist: (pageTitle: string, itemName: string) => void;
  trackRemoveFromWishlist: (pageTitle: string, itemName: string) => void;
  trackLanguageChange: (pageTitle: string, language: string) => void;
  trackCurrencyChange: (pageTitle: string, currency: string) => void;
  trackViewContent: (pageTitle: string, contentType: string) => void;
  trackEvent: (
    eventType: string,
    pageTitle: string,
    data: Record<string, string>
  ) => void;
  trackLogin: (
    customerId: string,
    pageTitle: string,
    data: Record<string, string>
  ) => void;
  trackLogout: (pageTitle: string, data: Record<string, string>) => void;
}

export default Ravelin as RavelinModuleInterface;
