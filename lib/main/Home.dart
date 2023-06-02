import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/core/Movie/cubit.dart';
import 'package:movie_app/core/Movie/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: MovieCubit.get(context)
                .screen[MovieCubit.get(context).selectedIndex],
            bottomNavigationBar: GNav(
              color: Colors.white,
              onTabChange: (int index) => MovieCubit.get(context).onTap(index),
              selectedIndex: MovieCubit.get(context).selectedIndex,
              tabs: MovieCubit.get(context).BottomItems,
              textStyle: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        );
      },
    );
  }
}
