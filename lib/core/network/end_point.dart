abstract class EndPoints {
  static const String baseUrl = "https://jazaer.progmaker.com/api/v2/";
  // static const String baseUrl = "https://photo.progmaker.com/api/v1/";
  // static const String baseImageUrl = '${baseUrl}uploads/';
  // static const String baseFileUrl = '${baseUrl}uploads/files/';

  //  Auth
  static const String loginUrl = 'auth/login';
  static const String logoutUrl = 'auth/logout';
  static const String doctorSignUpUrl = 'auth/doctor/register';
  static const String confirmPhoneUrl = 'Authentication/ConfirmPhone';

  static const String allDriverOrdersUrl = 'delivery/orders/all';
  static const String acceptOrderUrl = 'delivery/orders/{id}/accept';
  static const String completeOrderUrl = 'delivery/orders/{id}/complete';
  // static const String doctorSignUpUrl = 'Authentication/DoctorSignUp';
  // static const String confirmPhoneUrl = 'Authentication/ConfirmPhone';

  static const String orders = 'orders';
  static const String orderInvoice = 'orders/{orderId}/invoice';
  static const String updatePatientNameUrl = 'orders/{order_id}/patient-name';

  static const String createAppointment = 'save_order';

  static const String diagnosisOptions = 'diagnosis-options';

  static const String sections = 'sections';

  static const String labOrdersUrl = 'lab/orders/all';

  static const String receiveOrderUrl = 'lab/orders/{id}/receive';
  static const String deliverOrderUrl = 'lab/orders/{id}/deliver';
  static const String returnOrderUrl = 'lab/orders/{id}/return';
  static const String complainUrl = 'lab/complaints';
  static const String notifications = 'notifications';
  static const String adminNotifications = 'admin/notifications';
  static const String adminDashboard = 'admin/dashboard';
  static const String complaints = 'admin/complaints';
  static const String complaintDetails = 'admin/complaints/{id}';
  static const String updateComplaintStatus = 'admin/complaints/{id}/status';
  static const String adminOrders = 'admin/orders';
  static const String chatMessages = 'orders/{id}/chat/messages';

  // admin invoices
  static const String allInvoicesUrl = 'admin/invoices';
  static const String invoicesDetailsUrl = 'admin/invoices/{invoice_id}';
  static const String invoiceAddAdditionChargeUrl =
      'admin/invoices/{invoice_id}/additions';
  static const String invoiceUpdateAdditionChargeUrl =
      'admin/invoices/{invoice_id}/additions/{addition_id}';
  static const String invoiceDeleteAdditionChargeUrl =
      'admin/invoices/{invoice_id}/items/{addition_id}';
  static const String updatePaymentUrl = 'admin/invoices/{invoice_id}/payment';
  static const String getInvoicePaymentsUrl = 'admin/invoices/{invoice_id}/payments';
  static const String deleteInvoicePaymentUrl = 'admin/invoices/{invoice_id}/payments/{payment_id}';
  static const String invoiceDiscountUrl = 'admin/invoices/{invoice_id}/discount';

  // doctor invoices
  static const String allDoctorInvoicesUrl = 'invoices';
}
