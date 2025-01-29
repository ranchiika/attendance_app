import 'package:attendance_app/ui/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// an entry point for submitting the attendance report
final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance'); //entry point.

Future<void> submitAttendanceReport(BuildContext context,String address, String name, String status, String timeStamp, String attendanceStatus) async{
  showLoaderDialog(context);
  dataCollection.add(
    {
      'address' : address,
      'name' : name,
      'description' : attendanceStatus,
      'time' : timeStamp
    }
  ).then((result){
    Navigator.of(context).pop();
    try {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ),
            SizedBox(width: 10,),
            Text("Attendance sibmitted successfully",
            style: TextStyle(color:Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.orangeAccent,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen())
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Text(
                "Ups, $e",
                style: const TextStyle(color: Colors.white),
              )
            )
          ],
        ),
        backgroundColor: Colors.blueAccent,
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }).catchError((error){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Text(
              "Ups, $error",
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      backgroundColor: Colors.blueAccent,
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
    Navigator.of(context).pop();
  });
}

void showLoaderDialog(BuildContext context){
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
      const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        child: const Text("Checking the data..."),
        )
    ],),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext content){
      return alert;
    }
  );
}