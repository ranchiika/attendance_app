import 'package:attendance_app/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{ //yang dijalanin duluan itu initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( //sebelum menggunakan layanan dari firebase harus menggunakan inializaeApp 
    options: const FirebaseOptions(
      // Data di ambil dari file google-services.json
      apiKey: 'AIzaSyDtjAMu3_-hnM149msbTZT_4VwHfLNrIks', //current_key
      appId: '1:1052071315131:android:a1f686a48a60043114cb9e', //mobilesdk_app_id
      messagingSenderId: '1052071315131', //Project number
      projectId: 'attendance-app-f3e81' //project ID
      )
  );
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: CardTheme(surfaceTintColor: Colors.white),
        dialogTheme: DialogTheme(surfaceTintColor: Colors.white, backgroundColor: Colors.white,),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
      ),
      home: HomeScreen(),
    );
  }
}