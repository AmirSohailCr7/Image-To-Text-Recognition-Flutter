import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the services package for SystemNavigator
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagetextrecognition/commons/colors.dart';
import 'package:imagetextrecognition/commons/image_text_strings.dart';

class TopApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const TopApplicationBar({
    super.key,
    this.title = "",
    this.showBackButton = false, // Add a parameter to control the back button visibility
  });

  @override
  Size get preferredSize => Size.fromHeight(63.sp);

  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
            color: KColors.blackColor,
            gradient: LinearGradient(
              colors: [
                KColors.primaryColor,
                KColors.secondaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.mirror,
            ),
          ),
      child: AppBar(
        toolbarHeight: 150.h,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (showBackButton)
              IconButton(
                icon: const Icon(Icons.arrow_back, color: KColors.blackColor),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
               if (!showBackButton)
            Container(
                width: 40.w,
                        height: 55.h,
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: KColors.blackColor,
                          gradient: LinearGradient(
                            colors: [
                              KColors.secondaryColor,
                              KColors.secondaryColor,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.mirror,
                          ),
                        ),
              child: Image.asset(
                KImages.OCRPROLogo,
                height: 100.h,
                width: 80.h,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: KColors.whiteColor, fontWeight: FontWeight.w600),
            )
          ],
        ),
        leadingWidth:250.h, 
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: IconButton(
              icon: Image.asset(
                KImages.logOut,
                height: 22.h,
                color: KColors.whiteColor,
              ),
              onPressed: () {
                SystemNavigator.pop(); // Exit the app
              },
            ),
          ),
        ],
      ),
    );
  }
}
