import 'dart:io';

import 'package:flutter_employee_app/widgets/fingerprint_capture_widget.dart';
import 'package:flutter_employee_app/widgets/signature_capture_widget.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img; // For image processing

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  _CaptureScreenState createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  File? _fingerLeftprintImage;
  File? _fingerRightprintImage;
  File? _signatureImage;

  // Function to handle fingerprint image capture
  void _onLeftFingerprintCaptured(File image) {
    setState(() {
      // _fingerLeftprintImage =
          processImage(image); // Process and update the left fingerprint image
    });
  }

  void _onRightFingerprintCaptured(File image) {
    setState(() {
      _fingerRightprintImage =
          processImage(image); // Process and update the left fingerprint image
    });
  }

  // Function to handle signature image capture
  void _onSignatureCaptured(File image) {
    setState(() {
      _signatureImage =
          processImage(image); // Process and update the signature image
    });
  }

  // Function to process the image to grayscale
  File processImage(File imageFile) {
    final originalImage = img.decodeImage(imageFile.readAsBytesSync());

    if (originalImage == null) {
      throw Exception("Failed to process image");
    }

    // Apply grayscale filter
    final grayscaleImage = img.grayscale(originalImage);

    // Save the processed image
    final processedImageFile = File('${imageFile.path}_processed.png')
      ..writeAsBytesSync(img.encodePng(grayscaleImage));

    return processedImageFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Capture Fingerprint and Signature")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FingerprintCaptureWidget(
              isScanned: _fingerLeftprintImage !=
                  null, // If image is available, show scanned state
              onCapture: _onLeftFingerprintCaptured, // Pass the capture method
              captureType: 'Left Fingerprint', // Pass 'Left Fingerprint'
            ),
            const SizedBox(height: 20),
            FingerprintCaptureWidget(
              isScanned: _fingerRightprintImage != null,
              onCapture: _onRightFingerprintCaptured,
              captureType: 'Right Fingerprint', // Pass 'Right Fingerprint'
            ),
            const SizedBox(height: 20),
            SignatureCaptureWidget(
              isCaptured: _signatureImage !=
                  null, // If signature image is available, show scanned state
              onCapture: _onSignatureCaptured, // Pass the capture method
              captureType: 'Signature', // Pass 'Signature'
            ),
            const SizedBox(height: 20),
            _signatureImage != null
                ? Image.file(
                    _signatureImage!) // Display the captured signature image
                : const Text('No signature captured'),
            const SizedBox(height: 20),
            _fingerLeftprintImage != null
                ? Image.file(
                    _fingerLeftprintImage!) // Display the captured left fingerprint image
                : const Text('No left fingerprint captured'),
            const SizedBox(height: 20),
            _fingerRightprintImage != null
                ? Image.file(
                    _fingerRightprintImage!) // Display the captured right fingerprint image
                : const Text('No right fingerprint captured'),
          ],
        ),
      ),
    );
  }
}
