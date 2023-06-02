import 'package:flutter/material.dart';
import 'package:movie_app/Helper/constant.dart';

class ScreenShotMovie extends StatelessWidget {
  String? image;
  ScreenShotMovie({this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        // padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: primaryColor,
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: imageLoading(
            url: image,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
