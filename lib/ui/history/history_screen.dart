import 'package:attendance_app/services/data_service.dart';
import 'package:attendance_app/ui/history/components/attendance_card.dart';
import 'package:attendance_app/ui/history/components/delete_dialog.dart';
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
        title: const Text("Attendance History"),
      ),
      body: StreamBuilder(//membungkus atau mempertahankan widget kita menjadi sebuah satu ke satuan.
        stream: dataService.dataCollection.snapshots(), //memanggil data yang kita miliki | Steam : memberitahukan si UI. 
        builder: (context, AsyncSnapshot<QuerySnapshot> snapShot){
          if (!snapShot.hasData) {
            return const Center(
              child: Text("Nothing history"),
            );
          } 

          final data = snapShot.data!.docs;

          return ListView.builder( //sisi positif
            itemCount: data.length,
            itemBuilder: (context, index){ //index itu int.
              return AttendanceHistoryCard(
                //untuk mendefinisikan data yang akan muncul di ui berdasarkan index atau posisi yang ada di database (db)
                data: data[index].data() as Map<String, dynamic>, 
                onDelete: (){
                  showDialog(
                    context: context,
                    builder: (context) => DeleteDialog(
                      // untuk mnejadikan index sebagai Id dari data yang ada di db.
                      documentId: data[index].id,
                      dataCollection: dataService.dataCollection,
                      // digunakan untuk memperbarui state setelah terjadi penghapusan dari db.
                      onConfirm: (){
                        setState(() {
                          dataService.deleteData(data[index].id);
                          Navigator.pop(context);
                        });
                      },
                    )
                  );
                },
              );
            },
          );
        }
      ), 
    );
  }
}