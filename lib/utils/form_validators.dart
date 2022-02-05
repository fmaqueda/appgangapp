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
    return null;
  }

  String? isFieldEmpty(String? text) {
    if (text == null || text.isEmpty) {
      return SK.field_cannot_be_empty;
    }
    return null;
  }

  String? isValidDescription(String? text) {
    if (text == null || text.isEmpty) {
      return SK.description_cannot_be_empty;
    } else if (text.length < 15) {
      return SK.description_too_short;
    }
    return null;
  }

  String? isValidPassword(String? text) {
    if (text == null || text.length < 6) {
      return SK.password_too_short;
    }
    return null;
  }

  String? isMatchedPassword({String? pass, String? repass}) {
    if (pass != repass) {
      return SK.password_not_match;
    }
    return null;
  }

  String? isValidPrice(String? text) {
    //RegExp re;

    //re = RegExp(r'[+-]?([0-9]*[.])?[0-9]+');

    if (text == null || text.isEmpty) {
      return SK.field_cannot_be_empty;
    } else {
      bool checkRegexp =
          RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$').hasMatch(text);

      text = num.parse(double.parse(text).toStringAsFixed(2)).toString();

      print(text);

      if (checkRegexp == false) {
        return SK.not_valid_number;
      } else {
        return null;
      }
    }
    //print(RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$').hasMatch(text!));

    //return "testando";
  }
}
