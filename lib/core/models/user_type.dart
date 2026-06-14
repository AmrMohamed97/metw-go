import 'package:flutter/material.dart';

enum UserType {
  all,
  doctor,
  delivery,
  admin,
  lab;

  static UserType fromString(String type) {
    return UserType.values.firstWhere((e) => e.name == type);
  }

  String get label {
    switch (this) {
      case UserType.doctor:
        return 'طبيب';
      case UserType.delivery:
        return 'مندوب';
      case UserType.admin:
        return 'مدير';
      case UserType.lab:
        return 'فني';
      case UserType.all:
        return 'الكل';
    }
  }

  String get labelPlural {
    switch (this) {
      case UserType.doctor:
        return 'الاطباء';
      case UserType.delivery:
        return 'المناديب';
      case UserType.admin:
        return 'المدراء';
      case UserType.lab:
        return 'الفنيين';
      case UserType.all:
        return 'الكل';
    }
  }

  IconData get icon {
    switch (this) {
      case UserType.doctor:
        return Icons.medical_services_outlined;
      case UserType.delivery:
        return Icons.delivery_dining_outlined;
      case UserType.admin:
        return Icons.admin_panel_settings_outlined;
      case UserType.lab:
        return Icons.biotech_outlined;
      case UserType.all:
        return Icons.people_outline;
    }
  }

  Color get color {
    switch (this) {
      case UserType.doctor:
        return const Color(0xFF4CAF93);
      case UserType.delivery:
        return const Color(0xFF5C7CFA);
      case UserType.admin:
        return const Color(0xFFE05C5C);
      case UserType.lab:
        return const Color(0xFFF4A636);
      case UserType.all:
        return const Color(0xFF9C27B0);
    }
  }
}
