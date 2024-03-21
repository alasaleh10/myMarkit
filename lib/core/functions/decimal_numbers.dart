import 'package:intl/intl.dart';

String decimalNumer({required int price}) {
  var formattedNumber =
      NumberFormat.currency(decimalDigits: 0, symbol: '').format(price);
  return formattedNumber;
}
