import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/core/Movie/cubit.dart';
import 'package:movie_app/core/Movie/states.dart';
import 'package:movie_app/screen/TrendingPersonDetails.dart';
import 'package:movie_app/screen/screen-movie/seeAllPopular.dart';
import 'package:movie_app/screen/screen-movie/seeAllTopRated.dart';
import 'package:movie_app/screen/trending.dart';
import 'package:movie_app/widget/ItemPerson.dart';
import 'package:movie_app/widget/itemMovie.dart';

import 'categoty/CategoryScreen.dart';
import 'screen-movie/seeAllNewly.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      builder: (context, state) {
        var popular = MovieCubit.get(context).popular;
        var nowPlay = MovieCubit.get(context).nowPlay;
        var topRated = MovieCubit.get(context).topRated;
        var trendingPerson = MovieCubit.get(context).trendingPerson;
        var cubit = MovieCubit.get(context);
        if (popular != null &&
            nowPlay != null &&
            topRated != null &&
            trendingPerson != null) {
          return DefaultTabController(
            length: 3,
            child: ZoomDrawer(
              controller: cubit.zoomDrawerController,
              menuScreen: const MenuScreen(),
              menuScreenOverlayColor: mainColor,
              menuBackgroundColor: mainColor,
              borderRadius: 24.0,
              showShadow: true,
              angle: 0.0,
              drawerShadowsBackgroundColor: primaryColor,
              slideWidth: MediaQuery.of(context).size.width * 0.65,
              mainScreen: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: IconButton(
                            onPressed: () => cubit.toggleDrawer(),
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF31314F),
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                              ),
                              hintText: 'search ',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ),
                        ),
                        TabBar(
                          onTap: (index) {},
                          automaticIndicatorColorAdjustment: true,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          indicatorPadding: const EdgeInsets.all(4),
                          indicatorSize: TabBarIndicatorSize.tab,
                          isScrollable: true,
                          labelStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: const Border(
                              bottom: BorderSide(
                                color: Color(0xFF31314F),
                              ),
                              top: BorderSide(
                                color: Color(0xFF31314F),
                              ),
                              right: BorderSide(
                                color: Color(0xFF31314F),
                              ),
                              left: BorderSide(
                                color: Color(0xFF31314F),
                              ),
                            ),
                          ),
                          tabs: const [
                            Tab(
                              child: Text('New Playing'),
                            ),
                            Tab(
                              child: Text('Top Rated'),
                            ),
                            Tab(
                              child: Text('Popular'),
                            ),
                          ],
                        ),

                           SizedBox(
                                height: 320,
                                child: TabBarView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'New Playing',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'muli',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    navigateTo(
                                                      child: seeAllNewly(),
                                                      context: context,
                                                    );
                                                  },
                                                  child: const Text(
                                                    'View All',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            child: Row(
                                              children: [
                                                for (int i = 0;
                                                    i < nowPlay.results!.length;
                                                    i++)
                                                  ItemMovie(
                                                    overview: nowPlay
                                                        .results?[i].overview,
                                                    title: nowPlay
                                                        .results?[i].title,
                                                    voteAverage: nowPlay
                                                        .results?[i].voteCount
                                                        ?.toDouble(),
                                                    image: nowPlay
                                                        .results?[i].posterPath,
                                                    id: nowPlay.results?[i].id,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Top Rated',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'muli',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    navigateTo(
                                                      child: seeAllTopRated(),
                                                      context: context,
                                                    );
                                                  },
                                                  child: const Text(
                                                    'View All',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: SingleChildScrollView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                for (int i = 0;
                                                    i <
                                                        topRated
                                                            .results!.length;
                                                    i++)
                                                  ItemMovie(
                                                    overview: topRated
                                                        .results?[i].overview,
                                                    title: topRated
                                                        .results?[i].title,
                                                    voteAverage: topRated
                                                        .results?[i]
                                                        .voteAverage,
                                                    image:
                                                        '${topRated.results?[i].posterPath}',
                                                    id: topRated.results![i].id,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Popular',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'muli',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    navigateTo(
                                                      child: seeAllPopular(),
                                                      context: context,
                                                    );
                                                  },
                                                  child: const Text(
                                                    'View All',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: SingleChildScrollView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                for (int i = 0;
                                                    i < popular.results.length;
                                                    i++)
                                                  ItemMovie(
                                                    title: popular
                                                        .results[i].title,
                                                    overview: popular
                                                        .results[i].overview,
                                                    image: popular
                                                        .results[i].posterPath,
                                                    voteAverage: popular
                                                        .results[i].voteCount
                                                        ?.toDouble(),
                                                    id: popular.results[i].id,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                         Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            'Person Trending',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'muli'),
                          ),
                        ),

                             Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (int i = 0;
                                          i < trendingPerson.results!.length;
                                          i++)
                                        InkWell(
                                          onTap: () {
                                            navigateTo(
                                              context: context,
                                              child: TrendingPersonDetailes(
                                                name: trendingPerson
                                                    .results![i].name!,
                                                gender: trendingPerson
                                                    .results![i].gender!,
                                                populartiy: trendingPerson
                                                    .results![i].popularity!,
                                                depart: trendingPerson
                                                    .results![i].name!,
                                                image: trendingPerson
                                                    .results![i].profilePath!,
                                                id: trendingPerson
                                                    .results![i].id!,
                                                knownFor: trendingPerson
                                                    .results![i].knownFor!,
                                              ),
                                            );
                                          },
                                          child: ItemPerson(
                                            height: 100,
                                            width: 100,
                                            name:
                                                trendingPerson.results?[i].name,
                                            image:
                                                '${trendingPerson.results?[i].profilePath}',
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const CheckData();
        }
      },
      listener: (context, state) {},
    );
  }
}

class CheckData extends StatelessWidget {
  const CheckData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Lottie.asset(
            'assets/images/loading/wrong.json',
            width: 400,
            height: 500,
          ),
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.center,
          // decoration: BoxDecoration(
          //   color: primaryColor,
          //   borderRadius: BorderRadius.circular(15),
          //   boxShadow: [
          //     BoxShadow(
          //       color: primaryColor.withOpacity(0.5),
          //       spreadRadius: 1,
          //       blurRadius: 4,
          //     ),
          //   ],
          // ),
          child: Column(
            children: [
              InkWell(
                child: itemDrawer(context, 'Category', Icons.category_outlined),
                onTap: () {
                  navigateTo(context: context, child: CategoryScreen());
                },
              ),
              InkWell(
                onTap: () {
                  navigateTo(context: context, child: const TrendingScreen());
                },
                child:
                    itemDrawer(context, 'Trending', Icons.trending_up_outlined),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget itemDrawer(context, String title, IconData icons) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.08,
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
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: const Radius.circular(15),
                  topLeft: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height,
            child: Icon(
              icons,
              color: Colors.white,
              size: 45,
            ),
          ),
          const Spacer(),
          Text(
            textAlign: TextAlign.center,
            title,
            style: style.copyWith(fontSize: 22),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }
}
