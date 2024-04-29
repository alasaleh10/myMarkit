import 'package:intl/intl.dart';
import 'package:tafqit/tafqit.dart';

String decimalNumer({required int price}) {
  var formattedNumber =
      NumberFormat.currency(decimalDigits: 0, symbol: '').format(price);
  return formattedNumber;
}

String decimalNumer2({required int price}) {
  var formattedNumber =
      NumberFormat.decimalPatternDigits(locale: 'ar').format(price);

  return formattedNumber;
}

String convertToArabicNumber({required int price}) {
  final tafqit = Tafqit();
  var numberTotext = tafqit.tafqitNumberWithParts(
      justWord: '',
      noOtherWord: '',
      listOfNumberAndParts: [price],
      tafqitUnitCode: TafqitUnitCode.yemeniRial);
  return numberTotext.toString();
}
