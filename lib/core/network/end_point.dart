abstract class EndPoints {
  static const String baseUrl = "https://lasco.evyx.lol/api/metwgo/";
  static const String baseImageUrl = "https://lasco.evyx.lol/";
  // static const String baseImageUrl = '${baseUrl}uploads/';
  // static const String baseFileUrl = '${baseUrl}uploads/files/';

  //  Auth
  static const String loginUrl = 'auth/login';
  static const String logoutUrl = 'auth/logout';
  static const String deleteAccountUrl = 'profile/delete-account';
  static const String registerUrl = 'auth/register/step-1';
  static const String registerStep2 = 'auth/register/step-2';
  static const String warehouses = 'warehouses';
  static const String transportTypes = 'lookups/transport-types';
  static const String governorates = 'lookups/governorates';
  static const String cities = 'lookups/cities';
  static const String registerStep3 = 'auth/register/step-3';
  static const String registerStep4 = 'auth/register/step-4';
  static const String registerStep5 = 'auth/register/step-5';
  static const String forgotPasswordSendOtpUrl =
      'auth/forgot-password/send-otp';
  static const String verifyOtpUrl = 'auth/otp/verify';
  static const String resendOtpUrl = 'auth/otp/resend';
  static const String changePasswordUrl = 'auth/password/change';
  static const String confirmPhoneUrl = 'Authentication/ConfirmPhone';

  static const String orderDetailsUrl = 'orders/{orderId}';
  static const String incomingOrdersUrl = 'orders/incoming';

  static const String profileUrl = 'profile';
  static const String profileWorkInfoUrl = 'profile/work-info';
  static const String profileTransportUrl = 'profile/transport';
  static const String profileServiceAreasUrl = 'profile/service-areas';
  static const String profileDocumentsUrl = 'profile/documents';

  static const String startOrdersUrl = 'orders/{{order_id}}/start';
  static const String arrivePickupOrdersUrl =
      'orders/{{order_id}}/arrive-pickup';
  static const String confirmationOrdersUrl =
      'orders/{{order_id}}/pickup-confirmation';
  static const String dropoffOrdersUrl = 'orders/{{order_id}}/arrive-dropoff';
  static const String completeOrdersUrl =
      'orders/{{order_id}}/complete-delivery';

  static const String walletOperationsUrl = 'wallet/operations';
  static const String walletOverviewUrl = 'wallet/overview';

  static const String faqUrl = 'support/faq';
  static const String privacyUrl = 'support/privacy';
  static const String contactUsUrl = 'support/contact-us';

  static const String returnReasonsUrl = 'return-reasons';
  static const String rejectOrderUrl = 'orders/{orderId}/reject';
}
