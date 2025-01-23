import 'package:attendance_app/ui/attend/attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope( //untuk make sure mau back atau enggak takutnya ada data yang gak kesimpen
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) { //pop up yang muncul kalo mau keluar aplikasi.
        if (didPop) {
          return;
        }
        _onWillPop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuItem(
                  context,
                  imagePath: '/assets/images/ic_attend.png',
                  label: 'Attendance Report',
                  destination: const AttendanceScreen(image: null,)
                ),
                SizedBox(height: 40,),

                _buildMenuItem(
                  context,
                  imagePath: '/assets/images/ic_permission.png',
                  label: 'Permission Report',
                  destination: const AttendanceScreen(image: null,)
                ),
                SizedBox(height: 40,),

                _buildMenuItem(
                  context,
                  imagePath: '/assets/images/ic_history.png',
                  label: 'Attendance History',
                  destination: const AttendanceScreen(image: null,)
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    {
      required String imagePath,
      required String label,
      required Widget destination
    }) {
    return Container(
                margin: const EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
                    },
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(imagePath),
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          'Attendance',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) =>
      AlertDialog(
        title: const Text("INFORMATION",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        ),
        content: const Text(
          "Do You want to exit",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton( //No
            onPressed: ()=> Navigator.of(context).pop(false),
            child: const Text(
              "No",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14
              ),
            )
          ),

          TextButton( //Yes
            onPressed: ()=> SystemNavigator.pop(), //untuk kelua dari aplikasi
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14
              ),
            )
          ),
        ],
      )
      )
    /* Ini adalah default value ketika semua kode yang ada di block 
    block allert dialog tidak tereksekusi karena bbrp hal*/
    )??
    false;
  }
}