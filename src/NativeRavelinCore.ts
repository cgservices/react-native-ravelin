import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  configure(apiKey: string, appVersion: string): Promise<void>;
  getDeviceId(): Promise<string>;
  setCustomerId(customerId: string): Promise<void>;
  setOrderId(orderId: string): Promise<void>;
  trackPage(pageTitle: string, data: Object): Promise<void>;
  trackSearch(pageTitle: string, searchValue: string): Promise<void>;
  trackSelectOption(
    pageTitle: string,
    option: string,
    optionValue: string
  ): Promise<void>;
  trackAddToCart(
    pageTitle: string,
    itemName: string,
    quantity: number
  ): Promise<void>;
  trackRemoveFromCart(
    pageTitle: string,
    itemName: string,
    quantity: number
  ): Promise<void>;
  trackAddToWishlist(pageTitle: string, itemName: string): Promise<void>;
  trackRemoveFromWishlist(pageTitle: string, itemName: string): Promise<void>;
  trackLanguageChange(pageTitle: string, language: string): Promise<void>;
  trackCurrencyChange(pageTitle: string, currency: string): Promise<void>;
  trackViewContent(pageTitle: string, contentType: string): Promise<void>;
  trackEvent(eventType: string, pageTitle: string, data: Object): Promise<void>;
  trackLogin(pageTitle: string, data: Object): Promise<void>;
  trackLogOut(pageTitle: string, data: Object): Promise<void>;
  trackFingerprint(): Promise<void>;
  trackPaste(pageTitle: string, pastedValue: string): Promise<void>;
  cleanup(): Promise<void>;
}

export default TurboModuleRegistry.getEnforcing<Spec>('RavelinCore');
