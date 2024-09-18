import 'package:intl/intl.dart';

String formattedNow() {
  final now = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');
  final formattedDate = formatter.format(now);
  return formattedDate;
}
