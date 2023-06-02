import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/core/Movie/cubit.dart';
import 'package:movie_app/core/Movie/states.dart';
import 'package:movie_app/screen/YouTubePlayer.dart';
import 'package:movie_app/screen/screen-movie/seeAllNewly.dart';
import 'package:movie_app/screen/screen-movie/seeAllSimilar.dart';
import 'package:movie_app/screen/seeAllRecmonded.dart';
import 'package:movie_app/widget/ScreenShotMovie.dart';
import 'package:movie_app/widget/itemMovieDetails.dart';

import 'ItemPerson.dart';

class MovieDetail extends StatelessWidget {
  MovieDetail({
    this.image,
    this.overview,
    this.title,
    this.voteAverage,
    this.mainTitle,
    this.id,
  });

  String? mainTitle;
  String? title;
  String? image;
  double? voteAverage;
  String? overview;
  int? id;

  @override
  Widget build(BuildContext context) {

    MovieCubit.get(context).getCastCrew(id!);
    MovieCubit.get(context).getRecommendedMovies(id!);
    MovieCubit.get(context).getSimilarMovies(id!);
    MovieCubit.get(context).getImageMovie(id!);
    MovieCubit.get(context).getYouTubeId(id!);
    return BlocConsumer<MovieCubit, MovieStates>(
      builder: (context, state) {
        var castCrew = MovieCubit.get(context).castCrew;
        var recommendedMovies = MovieCubit.get(context).recommendedMovies;
        var similarMovies = MovieCubit.get(context).similarMovies;
        var imageMovie = MovieCubit.get(context).imageMovie;
        var youTubeId = MovieCubit.get(context).youTubeId;
        if (id != 0 &&
            castCrew != null &&
            recommendedMovies != null &&
            similarMovies != null &&
            imageMovie != null) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Opacity(
                        opacity: 0.4,
                        child: imageLoading(
                          height: 280,
                          width: double.infinity,
                          url: 'https://image.tmdb.org/t/p/original$image',
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.red.withOpacity(0.9),
                                          spreadRadius: 1,
                                          blurRadius: 4),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: imageLoading(
                                      url:
                                          'https://image.tmdb.org/t/p/original$image',
                                      width: 180,
                                      height: 250,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTo(
                                        child: YouTubePlayer(),
                                        context: context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 50, top: 40),
                                    height: 80,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.red,
                                              spreadRadius: 1,
                                              blurRadius: 4),
                                        ]),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 80,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            child: Text(
                              'Screenshoot',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'muli',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i < imageMovie.backdrops!.length;
                                    i++)
                                  ScreenShotMovie(
                                    image:
                                        '$mainImage${imageMovie.backdrops?[i].filePath}',
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$title',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'muli',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '$overview',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      color: Colors.white, fontFamily: 'muli'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            child: Text(
                              'Actors',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'muli',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          //actors
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < castCrew.cast!.length; i++)
                                  ItemPerson(
                                    name: castCrew.cast?[i].name,
                                    image:
                                        '$mainImage${castCrew.cast?[i].profilePath}',
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //Recommended
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                child: Text(
                                  'Recommended',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'muli',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(
                                      child: SeeAllRecomendedScreen(id),
                                      context: context,
                                    );
                                  },
                                  child: const Text('View All')),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i < recommendedMovies.results!.length;
                                    i++)
                                  itemMovieDetails(
                                    image: recommendedMovies
                                        .results![i].posterPath,
                                    title: recommendedMovies.results![i].title,
                                    voteAverage: recommendedMovies
                                        .results![i].voteAverage,
                                  ),
                              ],
                            ),
                          ),
                          //Similar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                child: Text(
                                  'Similar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'muli',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(
                                      child: seeAllSimilar(),
                                      context: context,
                                    );
                                  },
                                  child: const Text('View All'),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i < similarMovies.results!.length;
                                    i++)
                                  itemMovieDetails(
                                    image: similarMovies.results![i].posterPath,
                                    title: similarMovies.results![i].title,
                                    voteAverage:
                                        similarMovies.results![i].voteAverage,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Lottie.asset(
                  'assets/images/loading/loading1.json',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          );
        }
      },
      listener: (context, state) {},
    );
  }
}
