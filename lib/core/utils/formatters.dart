import 'package:intl/intl.dart';

class Formatters {

  static String number(int number) {
    return NumberFormat("#,###").format(number);
  }


  static String indianNumber(int number) {
    return NumberFormat("#,##,###", "en_IN").format(number);
  }
}