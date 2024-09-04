import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagetextrecognition/commons/custom_widgets/custom_appbar.dart';

class DetailDiseaseScreen extends StatelessWidget {
  final String imagePath;
  final String title;

  const DetailDiseaseScreen({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Example paragraphs for diagnosis and treatment
    final String diagnosisParagraph = 
        "To diagnose this disease, healthcare providers usually perform a physical examination, review medical history, and may conduct certain tests. These tests could include blood tests, imaging, or biopsies depending on the disease. The goal is to accurately identify the disease to provide appropriate treatment." *5;

    final String treatmentParagraph = 
        "Treatment for this disease typically involves a combination of medication, lifestyle changes, and sometimes surgery. Medications may include anti-inflammatory drugs, antibiotics, or specific treatments targeted at the underlying cause. Lifestyle changes might involve dietary adjustments, physical therapy, or stress management. It is essential to follow the treatment plan prescribed by the healthcare provider." *10;

    return Scaffold(
      appBar: TopApplicationBar(
        title: title,
        showBackButton: true, // Show the back button on this screen
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300.w,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  elevation: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'How to Diagnose the Disease',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              _buildParagraph(diagnosisParagraph, context),
              SizedBox(height: 24.h),
              Text(
                'What Are the Treatments Available?',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              _buildParagraph(treatmentParagraph, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParagraph(String text, BuildContext context) {
    // Split long paragraphs into smaller chunks
    final paragraphs = _splitIntoParagraphs(text);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphs.map((paragraph) => Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text(
          paragraph,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      )).toList(),
    );
  }

  List<String> _splitIntoParagraphs(String text) {
    final maxWords = 50; // Maximum number of words per paragraph
    final paragraphs = <String>[];

    // Split the text into sentences using periods
    final sentences = text.split(RegExp(r'(?<=[.!?])\s+'));
    var currentParagraph = <String>[];
    var currentWordCount = 0;

    for (final sentence in sentences) {
      final words = sentence.split(' ');
      currentWordCount += words.length;

      // Add the sentence to the current paragraph
      currentParagraph.add(sentence);

      // When the paragraph reaches the max word count, add it to the list and start a new one
      if (currentWordCount >= maxWords) {
        paragraphs.add(currentParagraph.join(' '));
        currentParagraph = <String>[]; // Start a new paragraph
        currentWordCount = 0;
      }
    }

    // Add any remaining sentences as the last paragraph
    if (currentParagraph.isNotEmpty) {
      paragraphs.add(currentParagraph.join(' '));
    }

    return paragraphs;
  }
}
