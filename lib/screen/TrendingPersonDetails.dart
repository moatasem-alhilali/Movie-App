import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/Model/Trending/TrendingPerson.dart';
import 'package:movie_app/Model/Trending/TrendingPerson.dart';
import 'package:movie_app/core/Movie/cubit.dart';
import 'package:movie_app/core/Movie/states.dart';
import 'package:movie_app/widget/ItemPerson.dart';

class TrendingPersonDetailes extends StatelessWidget {
  TrendingPersonDetailes({
    required this.knownFor,
    required this.name,
    required this.gender,
    required this.depart,
    required this.populartiy,
    required this.id,
    required this.image
  });

  List<KnownFor> knownFor;
  String name;
  int gender;
  double populartiy;
  String depart;
  int id;
  String image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      builder: (context, state) {
        if (id != null) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.9),
                                spreadRadius: 1,
                                blurRadius: 4),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: imageLoading(
                            url: '$mainImage$image',
                            width: double.infinity,
                            height: 300,
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Name: $name',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'muli',
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'popularity:  ${populartiy}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'muli',
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Department:  $depart',
                                  style: const TextStyle(
                                    color: Colors.white,

                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'muli',
                                    fontSize: 14,
                                  ),
                                ),
                               gender == 1
                                    ? const Text(
                                        'Gender:  Female',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'muli',
                                          fontSize: 14,
                                        ),
                                      )
                                    : const Text(
                                        'Gender: Male',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'muli',
                                          fontSize: 14,
                                        ),
                                      ),

                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              child: Text(
                                'Known For ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'muli',
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0; i < knownFor.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ItemPerson(
                                        width: 160,
                                        name: knownFor[i].title,
                                        image: '$mainImage${knownFor[i].posterPath}',
                                      ),
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
