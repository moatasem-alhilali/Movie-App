import 'package:flutter/material.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/widget/MovieDetails.dart';

class ItemMovie extends StatelessWidget {
  ItemMovie({
    this.image,
    this.overview,
    this.title,
    this.voteAverage,
    this.mainTitle,
    this.height,
    this.width,
    this.widthImage,
    this.id,
  });

  String? mainTitle;
  int? id;

  String? title;
  String? image;
  double? voteAverage;
  String? overview;
  double? height;
  double? width;
  double? widthImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          child: MovieDetail(
            title: title,
            overview: overview,
            image: image,
            id: id,
          ),
          context: context,
        );
      },
      child: Container(
        height: height ?? 250,
        width: width ?? 220,
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: imageLoading(
                url: '$mainImage$image',
                height: 150,
                width: 350,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: title == null
                  ? null
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '$title',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'muli'),
                        ),
                        Text(
                          '$overview',
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'muli',
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size:20 ,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '$voteAverage',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: 'muli'),
                            )
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
