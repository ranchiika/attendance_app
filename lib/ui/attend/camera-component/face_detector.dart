import 'dart:math';
import 'dart:ui';
import 'package:attendance_app/utils/google_ml_kit.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorComponent {
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true, 
    enableClassification: true,
    enableTracking: true,
    enableLandmarks: true
  ));

  Future<void> detectFaces(XFile image) async{
    final inputImage = InputImage.fromFilePath(image.path);
    final faces = await faceDetector.processImage(inputImage);

    for (Face face in faces){
      final Rect boundingBox = face.boundingBox; // method mengambil beberapa komponen dari gambar

      // untuk menghandle posisi wajah secara vertikal
      final double? verticalPosition = face.headEulerAngleY; 
      final double? horizontalPosition = face.headEulerAngleZ;

      // perkondisian apabila face landmark sudah aktif, ditandai oleh (Mulut, mata, pipi, hidung dan telinga)
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      if (leftEar != null) {
        final Point<int> leftEarPosition = leftEar.position;
        // jika kupingnya kedeteksi, dia akan me return posisi telinga tersebut
        print("Left Ear Position: $leftEarPosition");
      }
      // perkondisian (if else) apabila wajahnya terdeteksi (ditandai dengan bibir senyum)
      if (face.smilingProbability != null) {
        final double? smilingProbability = face.smilingProbability;
        print("Smile Probability: $smilingProbability");
      }

      // perkondisian apabila fitur wajah sudah aktif 
      if (face.trackingId != null) {
        final int? trackingId = face.trackingId;
        
      }
    }
  }
}