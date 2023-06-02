import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/core/Movie/cubit.dart';
import 'package:movie_app/core/Movie/states.dart';
import 'package:movie_app/screen/HomePage.dart';
import 'package:movie_app/widget/CarouselSliderWidgets.dart';
import 'package:movie_app/widget/ItemPerson.dart';
import 'package:movie_app/widget/UpComming/CommingDetail.dart';
import 'package:movie_app/widget/itemMovie.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      builder: (context, state) {
        double _w = MediaQuery.of(context).size.width;
        var trendingTv = MovieCubit.get(context).trendingTv;
        var trendingMovie = MovieCubit.get(context).trendingMovie;
        var trendingPerson = MovieCubit.get(context).trendingPerson;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: (trendingPerson != null &&
                    trendingMovie != null &&
                    trendingTv != null)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider.builder(
                        itemCount:
                            MovieCubit.get(context).upcoming!.results!.length,
                        itemBuilder: (context, index, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ComingDetail(
                                    results: MovieCubit.get(context)
                                        .upcoming!
                                        .results![index],
                                  ),
                                ),
                              );
                            },
                            child: CarouselSliderWidgets(
                              index: index,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          pauseAutoPlayOnTouch: true,
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Text(
                          'Person Trending',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'muli'),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0;
                                i < trendingPerson.results!.length;
                                i++)
                              ItemPerson(
                                name: trendingPerson.results?[i].name,
                                image:
                                    '$mainImage${trendingPerson.results?[i].profilePath}',
                              ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          'Movie Trending',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'muli'),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0;
                                i < trendingMovie.results!.length;
                                i++)
                              ItemMovie(
                                title: trendingMovie.results![i].title,
                                overview: trendingMovie.results![i].overview,
                                image:
                                    '$mainImage${trendingMovie.results?[i].posterPath}',
                                voteAverage: trendingMovie.results![i].voteCount
                                    ?.toDouble(),
                                id: trendingMovie.results![i].id,
                              ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: Text(
                          'Tv Trending',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'muli'),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < trendingTv.results!.length; i++)
                              ItemMovie(
                                title: trendingTv.results![i].name,
                                overview: trendingTv.results![i].overview,
                                image:
                                    '$mainImage${trendingTv.results?[i].posterPath}',
                                voteAverage: trendingTv.results![i].voteCount
                                    ?.toDouble(),
                                id: trendingTv.results![i].id,
                                width: 200,
                              ),
                          ],
                        ),
                      ),
                    ],
                  )
                : CheckData(),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
