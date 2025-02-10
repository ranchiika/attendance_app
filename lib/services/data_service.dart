// Ini 80% penting tentang bagaimana get data dari interrnet.

import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  Future<QuerySnapshot> getData() { //ini  ngedapetin data
    return dataCollection.get();
  }

  Future<void> deleteData(String docId){ //buat delete
    return dataCollection.doc(docId).delete(); //datacollection menagmbil dari firebasefirestore
  } 
}