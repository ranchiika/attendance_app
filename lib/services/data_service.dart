// Ini 80% penting tentang bagaimana get data dari interrnet.

import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');
  // Aplikasi ini share app - untuk semua karena belom pake autenttikasi.

  Future<QuerySnapshot> getData() { //ini  ngedapetin data
  // Untuk mendapatkan atau membaca data dari database.
    return dataCollection.get();
  }

  Future<void> deleteData(String docId){ //buat delete
  // untuk menghapus data dari database.
    return dataCollection.doc(docId).delete(); //datacollection menagmbil dari firebasefirestore
  } 
}