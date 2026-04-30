class AppConstents {
  static const String appName = 'Portfolio Notebook';
  static const String telegramBaseUrl = 'https://api.telegram.org';
  static String telegramEndpoint({token, methodName}) =>
      '/bot$token/$methodName';
  static const String emailJsBaseUrl = 'https://api.emailjs.com';
  static const String emailJsEndpoint = '/api/v1.0/email/send';
  static const String whatsAppBaseUrl = 'https://wa.me';
  static String whatsAppEndpoint({phoneNumber, message}) =>
      '/$phoneNumber?text=$message';
}
