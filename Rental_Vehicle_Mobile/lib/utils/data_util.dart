import 'package:intl/intl.dart';

String formatCurrency(num number) {
  final oCcy = NumberFormat.currency(locale: 'vi', customPattern: '#,### \u00a4', symbol: 'đ/Day', decimalDigits: 0);
  return oCcy.format(number);
}
