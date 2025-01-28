import 'package:intl/intl.dart';

void setDateTime(Function(String, String, String) onDateTimeSet){
  DateTime dateNow = DateTime.now();
  var dateFormat = DateFormat('dd mm yyyy');
  var dateTime = DateFormat('hh:mm:ss');

  String date = dateFormat.format(dateNow);
  String time = dateFormat.format(dateNow);
  String currentDate = '$date | $time';

  onDateTimeSet(date, time, currentDate);

  
}