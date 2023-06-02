import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/core/Movie/cubit.dart';
import 'package:movie_app/core/Movie/states.dart';
import 'package:movie_app/widget/MovieDetails.dart';

class seeAllUpComing extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<seeAllUpComing>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var upcoming = MovieCubit.get(context).upcoming;
        return Scaffold(
          body: Stack(
            children: [
              ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  appBar(),
                  SizedBox(height: _w / 5.5),
                  for (int i = 0; i < upcoming!.results!.length; i++)
                    card(
                      route: MovieDetail(
                        title: upcoming.results![i].title,
                        overview: upcoming.results![i].overview,
                        image: '$mainImage${upcoming.results![i].posterPath}',
                        id: upcoming.results![i].id,
                      ),
                      title: upcoming.results![i].title,
                      subtitle: upcoming.results![i].overview,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: imageLoading(
                          url: '$mainImage${upcoming.results![i].posterPath}',
                        ),
                      ),
                      // route: RouteWhereYouGo(),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget appBar() {
    double _w = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: const Size(double.infinity, kToolbarHeight),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(.5),
          elevation: 0,
          title: Text(
            'Recommended',
            style: TextStyle(
              fontSize: _w / 17,
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            IconButton(
              tooltip: 'Settings',
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(Icons.movie_outlined,
                  color: Colors.black.withOpacity(.7)),
              onPressed: () {
                // HapticFeedback.lightImpact();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return RouteWhereYouGo();
                //     },
                //   ),
                // );
              },
            ),
            const Text('  '),
          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
    );
  }

  Widget card({
    String? title,
    String? subtitle,
    Widget? child,
    Widget? route,
  }) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: 1,
      child: Transform.translate(
        offset: const Offset(0, 1),
        child: Container(
          height: _w / 2.3,
          width: _w,
          padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => route!));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                      color: Colors.white.withOpacity(.1), width: 1)),
              child: Padding(
                padding: EdgeInsets.all(_w / 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: _w / 3,
                      width: _w / 3,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: child,
                    ),
                    SizedBox(width: _w / 40),
                    SizedBox(
                      width: _w / 2.05,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _w / 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 1,
                            ),
                          ),
                          Text(
                            subtitle!,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withOpacity(1),
                              fontSize: _w / 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Tap to know more',
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _w / 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
