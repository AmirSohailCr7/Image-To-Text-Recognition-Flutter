import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:imagetextrecognition/commons/custom_widgets/custom_appbar.dart';
import 'package:imagetextrecognition/dashboard/widgets/custom_image_picker.dart';
import 'package:imagetextrecognition/dashboard/widgets/custom_text_display.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  Future<String>? _extractedTextFuture;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        // Removed the text extraction here
        _extractedTextFuture =
            null; // Reset the text display until "Process" is pressed
      });
    }
  }

  Future<String> getImageTotext(final String imagePath) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(InputImage.fromFilePath(imagePath));
    return recognizedText.text.toString();
  }

  void _clearImage() {
    setState(() {
      _selectedImage = null;
      _extractedTextFuture = null;
    });
  }

  Future<void> _downloadText(String text) async {
    final directory =
        Directory('/storage/emulated/0/Download'); // Android download directory
    final filePath = '${directory.path}/Image_Text_downloaded.txt';
    final file = File(filePath);
    await file.writeAsString(text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('File downloaded to $filePath'),
    ));
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Text copied to clipboard'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopApplicationBar(title: 'Dashboard'),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImagePicker(
                selectedImage: _selectedImage,
                onPickImage: _pickImage,
                onClearImage: _clearImage,
              ),
              const SizedBox(height: 16),
              CustomTextDisplay(
                selectedImage: _selectedImage,
                extractedTextFuture: _extractedTextFuture,
                onClear: _clearImage,
                onProcess: () {
                  if (_selectedImage != null) {
                    setState(() {
                      _extractedTextFuture =
                          getImageTotext(_selectedImage!.path);
                    });
                  }
                },
                onCopy: _copyToClipboard,
                onDownload: _downloadText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
