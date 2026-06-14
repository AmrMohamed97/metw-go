import 'package:metw_go/core/theme/my_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum InvoiceStatus {
  unpaid,
  partiallyPaid,
  paid;

  static InvoiceStatus fromString(String name) {
    switch (name) {
      case 'unpaid':
        return InvoiceStatus.unpaid;
      case 'partially_paid':
        return InvoiceStatus.partiallyPaid;
      case 'paid':
        return InvoiceStatus.paid;

      default:
        throw ArgumentError('Invalid InvoiceStatus name: $name');
    }
  }

  String get nameAr {
    switch (this) {
      case InvoiceStatus.unpaid:
        return 'غير مدفوع';
      case InvoiceStatus.partiallyPaid:
        return 'مدفوع جزئيا';
      case InvoiceStatus.paid:
        return 'مدفوع';
    }
  }

  Color get color {
    switch (this) {
      case InvoiceStatus.unpaid:
        return MyColors.redNormal;
      case InvoiceStatus.partiallyPaid:
        return MyColors.purpleDark;
      case InvoiceStatus.paid:
        return MyColors.greenNormal;
    }
  }
}
