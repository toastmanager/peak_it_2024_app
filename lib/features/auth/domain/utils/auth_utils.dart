import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthUtils {
  static final phoneFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  static String unformatPhone(String phone) {
    return '+${AuthUtils.phoneFormatter.unmaskText(phone)}';
  }

  static bool isValidPhoneNumber(String? value) =>
      RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
          .hasMatch(value ?? '');
}
