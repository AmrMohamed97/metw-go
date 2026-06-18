// ==========================================
// app_routes.dart - Route paths constants
// ==========================================

class AppRoutes {
  // Auth routes
  static const String onbording = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';

  // Admin routes
  static const String admin = '/admin';
  static const String adminPending = '/admin/pending';
  static const String adminSections = '/admin/sections';
  static const String adminSectionsAdd = '/admin/sections/add';
  static const String adminSectionsEdit = '/admin/sections/edit/:id';
  static const String adminSectionWorkers = '/admin/sections/workers';
  static const String adminUsers = '/admin/users';
  static const String adminUsersAdd = '/admin/users/add';
  static const String adminRules = '/admin/rules';
  static const String adminComplaints = '/admin/complaints';
  static const String complaintDetails = '/admin/complaints/:id';

  // Doctor routes
  static const String doctor = '/doctor';
  static const String doctorCreate = '/doctor/create';
  static const String doctorTracking = '/doctor/tracking';
  static const String doctorReview = '/doctor/review';
  static const String doctorProfile = '/doctor/profile';
  // static const String doctorChat = '/doctor/chat';
  static const String doctorViewTeeth = '/doctor/view-teeth';
  static const String doctorOrderDetails = '/doctor/order-details';

  // Section Worker routes
  static const String sectionWorker = '/section-worker';
  static const String sectionWorkerReceive = '/section-worker/receive';
  static const String sectionWorkerReturn = '/section-worker/return';
  static const String sectionWorkerReport = '/section-worker/report';

  // open location page
  static const String openLocationPageName = 'openLocationPage';
  static const String openLocationPage = '/openLocationPage';
  // Delivery routes
  static const String delivery = '/delivery';
  static const String deliveryAccept = '/delivery/accept';
  static const String deliveryComplete = '/delivery/complete';

  static const String notifications = '/notifications';
  static const String notificationDetails = '/notifications/:id';

  // google maps
  static const String assignLocationPage = '/assignLocationPage';
  // google maps
  static const String invoicesPage = '/invoicesPage';
  static const String invoicesPageName = 'invoicesPage';

  // Shared location
  static const String shareLocationPage = '/shareLocation';

  //  chat
  static const String chat = '/chat';
  
  // worder statistics
  static const String worderStatisticsPage = '/worderStatisticsPage';

  // Route names (for named navigation)
  static const String otpName = 'otp';
  static const String loginName = 'login';
  static const String registerName = 'register';
  static const String notificationsName = 'notifications';
  static const String notificationDetailsName = 'notification-details';
  static const String adminName = 'admin';
  static const String adminPendingName = 'admin-pending';
  static const String adminSectionsName = 'admin-sections';
  static const String adminSectionsAddName = 'admin-sections-add';
  static const String adminSectionsEditName = 'admin-sections-edit';
  static const String adminSectionWorkersName = 'admin-section-workers';
  static const String adminUsersName = 'admin-users';
  static const String adminUsersAddName = 'admin-users-add';
  static const String adminRulesName = 'admin-rules';
  static const String adminComplaintsName = 'admin-complaints';
  static const String complaintDetailsName = 'complaint-details';
  static const String doctorName = 'doctor';
  static const String doctorCreateName = 'doctor-create';
  static const String doctorReviewName = 'doctor-review';
  static const String orderInvoiceName = 'order-invoice';
  static const String doctorInvoicesName = 'doctor-invoices';
  static const String doctorViewTeethName = 'doctor-view-teeth';
  static const String doctorOrderDetailsName = 'doctor-order-details';
  static const String sectionWorkerName = 'section-worker';
  static const String sectionWorkerReceiveName = 'section-worker-receive';
  static const String sectionWorkerReturnName = 'section-worker-return';
  static const String sectionWorkerReportName = 'section-worker-report';
  static const String deliveryName = 'delivery';
  static const String deliveryAcceptName = 'delivery-accept';
  static const String deliveryCompleteName = 'delivery-complete';
  static const String assignLocationPageName = 'assignLocationPage';
  static const String editSection = '/admin/sections/edit/:id';
  static String adminUsersEditName = '/admin/users/edit/:id';
  static String adminDiagnoses = '/admin/diagnoses';
  static String adminOrdersPage = '/admin/adminOrdersPage';
  static String adminOrderDetailsPage = '/admin/adminOrderDetailsPage';
}
