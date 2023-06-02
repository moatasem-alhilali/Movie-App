import 'package:flutter/material.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/core/Movie/cubit.dart';

class CarouselSliderWidgets extends StatelessWidget {
  CarouselSliderWidgets({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: imageLoading(
            url:
                '$mainImage${MovieCubit.get(context).upcoming?.results?[index].posterPath}',
            width: 370,
            height: 210,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
            left: 15,
          ),
          child: Text(
            ' ${MovieCubit.get(context).nowPlay?.results?[index].title}',
            style: const TextStyle(
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'muli',
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
