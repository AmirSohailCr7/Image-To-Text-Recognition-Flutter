import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagetextrecognition/commons/colors.dart';

class PrimaryThemedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryThemedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          constraints: BoxConstraints(
              maxWidth: 600.w,
              minWidth: 300.w,
            minHeight: 40.h,
            maxHeight: 40.h
          ),
          decoration: BoxDecoration(
            color: KColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
              gradient:const LinearGradient(
              colors: [
              KColors.primaryColor,
              KColors.secondaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.mirror,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: KColors.whiteColor, letterSpacing: .5),
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteWhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CompleteWhiteButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          constraints: BoxConstraints(maxWidth: 600.w, minWidth: 300.w),
          height: 40.h,
          decoration: BoxDecoration(
            color: KColors.whiteColor,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: KColors.secondaryColor),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryOutLinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryOutLinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          constraints: BoxConstraints(
              maxWidth: 600.w,
              minWidth: 300.w,
              minHeight: 40.h,
              maxHeight: 40.h
          ),
          height: 40.h,
          decoration: BoxDecoration(
            color: KColors.whiteColor,
            border: Border.all(
              color: KColors.primaryColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: KColors.secondaryColor),
            ),
          ),
        ),
      ),
    );
  }
}

