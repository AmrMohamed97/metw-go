enum UserStatus {
  pending,
  active,
  inactive,
  rejected;

  static UserStatus fromString(String status) {
    return UserStatus.values.firstWhere((e) => e.name == status);
  }

  String get label {
    switch (this) {
      case UserStatus.pending:
        return 'قيد الانتظار';
      case UserStatus.active:
        return 'نشط';
      case UserStatus.inactive:
        return 'غير نشط';
      case UserStatus.rejected:
        return 'مرفوض';
    }
  }
}
