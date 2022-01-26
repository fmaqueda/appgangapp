import 'package:appgangapp/lang/string_keys.dart';
import 'package:get/get.dart';

class FormValidator {
  String? isValidEmail(String? text) {
    return (text ?? "").isEmail ? null : SK.not_valid_email;
  }

  String? isValidName(String? text) {
    if (text == null || text.isEmpty) {
      return SK.name_cannot_be_empty;
    }
  }

  String? isValidPassword(String? text) {
    if (text == null || text.length < 6) {
      return SK.password_too_short;
    }
  }

  String? isMatchedPassword({String? pass, String? repass}) {
    if (pass != repass) {
      return SK.password_not_match;
    }
  }
}
