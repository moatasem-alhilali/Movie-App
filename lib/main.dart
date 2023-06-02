import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Helper/BlocObserver/BlocObserver.dart';
import 'package:movie_app/Helper/dio_helper.dart';
import 'package:movie_app/core/Movie/cubit.dart';

import 'main/Home.dart';
import 'screen/HomePage.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MovieCubit()
            ..getTopRated()
            ..getUpcoming()
            ..getPopular()
            ..getNowPlaying()
            ..getGenreMovies()
            ..getTrendingPerson()
            ..getTrendingMovie()
            ..getTrendingTv(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color(0xFF0F111D),
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
