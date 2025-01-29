import 'package:flutter/material.dart';

Padding buildNameInputField(TextEditingController controllerName) {
return Padding(
  padding: EdgeInsets.all(10),
  child: TextField(
    textInputAction: TextInputAction.done,
    keyboardType: TextInputType.text,
    controller: controllerName,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      labelText: "Your Namne",
      labelStyle: TextStyle(
        fontSize: 14,
        color: Colors.blueAccent
      ),
      hintText: "Please enter your name",
      hintStyle: TextStyle(
        fontSize: 14,
        color: Colors.grey
      )
    ),
  ),
  );
}