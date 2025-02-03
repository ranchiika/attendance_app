import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

  class CameraControllerComponent {
  List<CameraDescription>? cameras;
  CameraController? controller;
  bool isBusy = false;
  
  Future<void> loadCamera()async{
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty ) {
      controller = CameraController(cameras![0], ResolutionPreset.high);
      await controller! .initialize();
    }

  }

  Widget buildCameraPreview(){
    if (controller == null || controller!.value.isInitialized) {
      // aksi apabila kondisi bernilai negatif (-)
      return const Center(child: CircularProgressIndicator(),);
    }
    // aksi apabila kondisi bernilai positif (+)
    return CameraPreview(controller!);
  }
}

// [0] = rear camera
// [1] = front camera
// ! di depan : Not
// ! di belakang : ada isinya