

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/core/Movie/cubit.dart';
import 'package:movie_app/core/Movie/states.dart';
import 'package:movie_app/screen/HomePage.dart';

import 'CategoryScreenDetails.dart';



class CategoryScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      builder: (context, state) {
        var genreMovies = MovieCubit.get(context).genreMovies;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),

          body: genreMovies == null
              ? CheckData()
              : SafeArea(
                child: GridView.builder(
            physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: genreMovies.genres!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return cardsGroup(
                        context: context,
                        title: genreMovies.genres?[index].name,
                        route: CategoryScreenDetails(genreMovies.genres?[index].id),
                      );
                    },
                  ),
              ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget cardsGroup({
    String? title,
    IconData? icon,
    Widget? route,
    context
  }) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: 1,
      child: Transform.translate(
        offset: const Offset(0, 1),
        child: Container(
          margin: EdgeInsets.fromLTRB(_w / 25, _w / 25, _w / 25, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardWidget(title: title, route: route,context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardWidget({String? title, Widget? route,context}) {
    double _w = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return route!;
            },
          ),
        );
      },
      child: Container(
        height: _w / 1,
        width: _w / 2.50,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title!,
          maxLines: 4,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 25,
              color: Colors.white.withOpacity(.7),
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
