import 'package:flutter/material.dart';
import 'package:movie_app/Helper/constant.dart';



class ItemPerson extends StatelessWidget {
  ItemPerson({this.name, this.image, this.height, this.width});

  String? name;
  String? image;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100,
      // height: 100,
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: primaryColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4),
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: imageLoading(
              errorHeight: 50,
              url:  '$mainImage$image',
              height: height ?? 150,
              width: width ?? 180,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
