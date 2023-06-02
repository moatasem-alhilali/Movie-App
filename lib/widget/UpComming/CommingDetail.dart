import 'package:flutter/material.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/Model/upcoming.dart';

class ComingDetail extends StatelessWidget {
  ComingDetail({required this.results});

  Results? results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.network(
              'https://image.tmdb.org/t/p/original${results?.backdropPath}',
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
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
                            // Navigator.pop(context);
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.9),
                              spreadRadius: 1,
                              blurRadius: 4),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/original${results?.backdropPath}',
                          height: 250,
                          width: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: const [
                              Text(
                                'language',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'EN',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: const [
                              Text(
                                'popularity',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '2254.254',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: const [
                              Text(
                                'Release ',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '2022-08-11',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: const [
                              Text(
                                'Film release date',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '2022-11-14',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // MoviePageDetail(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${results?.title}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${results?.overview}',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                            // fontSize: 30,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const RecommendedRatedWidgets(),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const CustomNavBar(),
    );
  }
}
