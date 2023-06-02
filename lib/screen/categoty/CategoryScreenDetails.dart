import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/core/Movie/cubit.dart';
import 'package:movie_app/core/Movie/states.dart';
import 'package:movie_app/widget/MovieDetails.dart';
import 'package:movie_app/widget/itemMovie.dart';

class CategoryScreenDetails extends StatelessWidget {
  CategoryScreenDetails(this.id);

  int? id;

  @override
  Widget build(BuildContext context) {
    MovieCubit.get(context).getGenreMoviesDetails(id!);
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        double _w = MediaQuery.of(context).size.width;
        var genreMoviesDetails = MovieCubit.get(context).genreMoviesDetails;
        return Scaffold(
          body: SafeArea(
            child: genreMoviesDetails == null
                ? Center(
                    child: Lottie.asset(
                      'assets/images/loading/loading1.json',
                      height: 200,
                      width: 200,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * 0.5,
                        childAspectRatio: 1 / 1.2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: genreMoviesDetails.results!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            navigateTo(
                              context: context,
                              child: MovieDetail(
                                voteAverage: genreMoviesDetails
                                    .results![index].popularity,
                                image:
                                    '$mainImage${genreMoviesDetails.results![index].posterPath}',
                                overview:
                                    genreMoviesDetails.results![index].overview,
                                title: genreMoviesDetails.results![index].title,
                                id: genreMoviesDetails.results![index].id,
                              ),
                            );
                          },
                          child: ItemMovie(
                            title: genreMoviesDetails.results![index].title,
                            overview:
                                genreMoviesDetails.results![index].overview,
                            image:
                                genreMoviesDetails.results![index].posterPath,
                            voteAverage:
                                genreMoviesDetails.results![index].popularity,
                            id: genreMoviesDetails.results![index].id,
                          ),
                        );
                      },
                    ),
                  ),
          ),
        );
      },
    );
  }
}
