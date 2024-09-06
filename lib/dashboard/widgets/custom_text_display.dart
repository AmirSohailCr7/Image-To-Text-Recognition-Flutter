import 'dart:io';
import 'package:flutter/material.dart';
import 'package:imagetextrecognition/commons/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextDisplay extends StatelessWidget {
  final File? selectedImage;
  final Future<String>? extractedTextFuture;
  final VoidCallback onClear;
  final VoidCallback onProcess; // Keep this to trigger the extraction
  final Function(String) onCopy;
  final Function(String) onDownload;

  const CustomTextDisplay({
    super.key,
    required this.selectedImage,
    required this.extractedTextFuture,
    required this.onClear,
    required this.onProcess,
    required this.onCopy,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (selectedImage != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: onClear,
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColors.primaryColor.withOpacity(0.7),
                ),
                child: const Text('Clear'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: onProcess,
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColors.secondaryColor,
                ), // Trigger the process when pressed
                child: const Text('Process'),
              ),
            ],
          ),
        const SizedBox(height: 16),
        Divider(height: 5, color: Colors.grey.shade500),
        const SizedBox(height: 16),
        if (extractedTextFuture != null)
          FutureBuilder<String>(
            future: extractedTextFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Image text converted!!! ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: Card(
                        elevation: 2,
                        surfaceTintColor: Colors.grey.shade500,
                        shadowColor: KColors.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectableText(
                            snapshot.data!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => onCopy(snapshot.data!),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                KColors.primaryColor.withOpacity(0.7),
                          ),
                          child: const Text('Copy'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () => onDownload(snapshot.data!),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: KColors.secondaryColor,
                          ),
                          child: const Text('Download'),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Text('No text found');
              }
            },
          ),
      ],
    );
  }
}
