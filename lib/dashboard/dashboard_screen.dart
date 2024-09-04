import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imagetextrecognition/commons/colors.dart';
import 'package:imagetextrecognition/commons/custom_widgets/custom_appbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of skin disease types with image paths and title
        File? selectedImage;

    return Scaffold(
      appBar: TopApplicationBar(title: 'Dashboard',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            height: 100,
            width: 300,
            child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.camera_alt,
                            color: KColors.blackColor ,
                          ),
                          title: Text(
                            'Camera',
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.image,
                            color: KColors.blackColor ,
                          ),
                          title: Text(
                              '',
                              style: Theme.of(context).textTheme.headlineSmall!),
                          onTap: () {
                            Navigator.of(context).pop();
                          
                          },
                        ),
                      ],
                    ),
                  );
                },),
          ),
          ],
        ),
      ),
    );
  }
}
