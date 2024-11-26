import 'package:easy_localization/easy_localization.dart';
import 'package:login_page_flutter_demo/gen/locale_keys.g.dart';

enum PasswordRequirements {
  upperLowerCase,
  number,
  lengthMoreThen8;

  String get name => switch (this) {
        lengthMoreThen8 =>
          LocaleKeys.passwordValidationErrors_lengthMoreThen8.tr(),
        upperLowerCase =>
          LocaleKeys.passwordValidationErrors_upperLowerCase.tr(),
        number => LocaleKeys.passwordValidationErrors_number.tr(),
      };
}

class PasswordValidator {
  static List<PasswordRequirements> validate(String value) {
    final failedRequirements = <PasswordRequirements>[];

    if (value.replaceAll(' ', '').length < 8) {
      failedRequirements.add(PasswordRequirements.lengthMoreThen8);
    }
    if (!value.contains(RegExp('[A-Z]')) || !value.contains(RegExp('[a-z]'))) {
      failedRequirements.add(PasswordRequirements.upperLowerCase);
    }

    if (!value.contains(RegExp('[0-9]'))) {
      failedRequirements.add(PasswordRequirements.number);
    }

    return failedRequirements;
  }
}
