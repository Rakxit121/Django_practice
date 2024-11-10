import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img; // For image processing
import 'package:image_picker/image_picker.dart'; // For image picking

class SignatureCaptureWidget extends StatelessWidget {
  final bool isCaptured;
  final Function(File) onCapture; // Callback function to handle image capture
  final String
      captureType; // To differentiate between different types of capture (e.g., "Signature")

  const SignatureCaptureWidget({
    super.key,
    required this.isCaptured,
    required this.onCapture,
    required this.captureType,
  });

  // Function to show options to capture an image or pick from the gallery
  void _showImageSourceOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Capture Image'),
                onTap: () {
                  _pickImage(ImageSource.camera, context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery, context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to pick an image from either camera or gallery
  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Process the image with grayscale filter before passing it to onCapture
      File processedImage = processImage(imageFile);

      // Pass the processed image to the onCapture function
      onCapture(processedImage);
    }

    // Close the dialog after selecting an image
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show the dialog when the container is tapped
        _showImageSourceOptions(context);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: 200,
        decoration: BoxDecoration(
          color: isCaptured ? Colors.greenAccent : Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isCaptured ? Icons.check : Icons.edit_outlined,
                color: isCaptured ? Colors.white : Colors.grey,
                size: 40,
              ),
              const SizedBox(height: 10),
              Text(
                isCaptured
                    ? 'Image Captured: $captureType'
                    : 'Click to Capture $captureType',
                style: TextStyle(
                  fontSize: 16,
                  color: isCaptured
                      ? Colors.white
                      : const Color.fromARGB(255, 158, 158, 158),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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