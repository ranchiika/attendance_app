import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormBody extends StatelessWidget {
  const FormBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final formController = TextEditingController();
    final toController = TextEditingController();
    String dropValueCategories = "Please Choose: "; //untuk default value kategorinya nya
    var categoriesList = <String>[
      "Please Choose",
      "Sick",
      "IDN Teaching",
      "Others"
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         TextField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          controller: nameController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: "Your Name",
            labelStyle: TextStyle(
              fontSize: 14,
              color: Colors.black
            ),
            hintText: "Please enter your name",
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blueAccent)
            )
          ),
         ),
         Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blueAccent,
                style: BorderStyle.solid,
                width: 1
              )
            ),
            child: DropdownButton(
              dropdownColor: Colors.white,
              value: dropValueCategories,
              onChanged: (value){
                dropValueCategories = value.toString();
              },
              items: categoriesList.map((value){
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                    ),
                  ),
                );
                // Method toList() berfungsi untuk mengkonfersi sebuah data acak menjadi berurutan pada list.
              }).toList(), // toList() gunanya untuk mengubah iterable (urutan) menjadi sebuah acak.
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black
              ),
              underline: Container(
                height: 2,
                color: Colors.blueGrey,
              ),
              isExpanded: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "From",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      Expanded(child: TextField(
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2025),
                              lastDate: DateTime(2030)
                            );
                            if (pickedDate != null) {
                              // untuk mengonversikan data detail tanggal yang di ambil dari pickerdate menjadi format dd/mm/yy
                              formController.text = DateFormat('dd/mm/yy').format(pickedDate);
                            }
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                          ),
                          controller: formController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Starting : ",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            )
                          ),
                        )
                      )
                    ],
                  )
                ),
                SizedBox(width: 14,),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Until: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2025), 
                              lastDate: DateTime(2030)
                            );
                            if (pickedDate != null) {
                              toController.text = DateFormat('dd/mm/yyyy').format(pickedDate);
                            }
                          },
                          style: TextStyle(
                            color: Colors.black
                          ),
                          controller: toController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Until",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            )
                          ),
                        )
                      )
                    ],
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}