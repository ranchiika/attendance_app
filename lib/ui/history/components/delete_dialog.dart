import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String documentId;
  final CollectionReference dataCollection;

  const DeleteDialog({super.key, required this.documentId, required this.dataCollection, Null Function()? onConfirm}); //onConfirm bisa ada bisa enggak

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Delete Data",
        style: TextStyle(
          fontSize: 18,
          color: Colors.black
        ),
      ),
      content: const Text(
        "Are you sure want to delete this history data?",
        style: TextStyle(
          fontSize: 18,
          color: Colors.black
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            "Yes",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black
            ),
          ),

          onPressed: (){
            // untuk berkomunikasi dengan database untuk melakukan penghapusan data dari database (DB)
            dataCollection.doc(documentId).delete();
            Navigator.pop(context); 
          },
        ),
        TextButton(
          child: const Text(
            "No",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black
            ),
          ),
          onPressed: (){
            Navigator.pop(context); 
          },
        )
      ],
    );
  }
}