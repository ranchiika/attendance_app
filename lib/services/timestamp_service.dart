import 'package:intl/intl.dart';

void setDateTime(Function(String, String, String) onDateTimeSet){ 
  DateTime dateNow = DateTime.now();
  var dateFormat = DateFormat('dd mm yyyy');
  var dateTime = DateFormat('hh:mm:ss');

  String date = dateFormat.format(dateNow);
  String time = dateTime.format(dateNow);
  String currentDate = '$date | $time';

  onDateTimeSet(date, time, currentDate);
}

void setAttendanceStatus(Function(String) onStatusSet){
  var dateNow = DateTime.now();
  var hour = int.parse(DateFormat('hh').format(dateNow));
  var minute = int.parse(DateFormat('mm').format(dateNow));

  String attendStatus;
  if (hour < 7 || (hour == 7 && minute == 00)) {
    attendStatus = "Attend";
  } else if (hour > 7 || (hour == 7 && minute >= 01)){
    attendStatus = "Late";
  } else {
    attendStatus = "Absent";
  }

  onStatusSet(attendStatus);
}