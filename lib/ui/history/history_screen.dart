import 'package:attendance_app/services/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance History"),
      ),
      body: StreamBuilder(//membungkus widgetkita menjadi sebuah satu ke satuan.
        stream: dataService.dataCollection.snapshots(), //memanggil data yang kita miliki | Steam : memberitahukan si UI. 
        builder: (context, AsyncSnapshot<QuerySnapshot> snapShot){
          if (!snapShot.hasData) {
            return const Center(
              child: Text("Nothing history"),
            );
          } 

          final data = snapShot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index){
              // put attendance card UI here
            },
          );
        }
      ), 
    );
  }
}