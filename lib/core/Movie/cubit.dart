import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/Model/BelongImageMovie.dart';
import 'package:movie_app/Model/CastCrew.dart';
import 'package:movie_app/Model/GenreMovies.dart';
import 'package:movie_app/Model/GenreMoviesDetails.dart';
import 'package:movie_app/Model/ImagesMovie.dart';
import 'package:movie_app/Model/Latest.dart';
import 'package:movie_app/Model/Movie.dart';
import 'package:movie_app/Model/RecommendedMovies.dart';
import 'package:movie_app/Model/SimilarMovies.dart';
import 'package:movie_app/Model/TranslationsMovies.dart';
import 'package:movie_app/Model/Trending/TrendingMovie.dart';
import 'package:movie_app/Model/Trending/TrendingPerson.dart';
import 'package:movie_app/Model/Trending/TrendingTv.dart';
import 'package:movie_app/Model/YouTubeId.dart';
import 'package:movie_app/Model/now_playing.dart';
import 'package:movie_app/Model/popular.dart';
import 'package:movie_app/Model/topRated.dart';
import 'package:movie_app/Model/upcoming.dart';
import 'package:movie_app/Helper/dio_helper.dart';
import 'package:movie_app/core/Movie/states.dart';
import 'package:movie_app/screen/categoty/CategoryScreen.dart';
import 'package:movie_app/screen/HomePage.dart';
import 'package:movie_app/screen/trending.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitialState());

  static MovieCubit get(context) => BlocProvider.of(context);
  List<GButton> BottomItems = [
    const GButton(
      icon: Icons.home,
      text: 'Home',
      textStyle: TextStyle(fontSize: 13, color: Colors.white),
      iconColor: Colors.white,
      iconActiveColor: Colors.white,
    ),
    const GButton(
      icon: Icons.category_outlined,
      text: 'Category',
      iconActiveColor: Colors.white,
      iconColor: Colors.white,
      textStyle: TextStyle(fontSize: 13, color: Colors.white),
    ),
    const GButton(
      icon: Icons.trending_up_outlined,
      text: 'Trending',
      textStyle: TextStyle(fontSize: 13, color: Colors.white),
      iconColor: Colors.white,
      iconActiveColor: Colors.white,
    ),

  ];
  List<Widget> screen = [
    const HomePage(),
    CategoryScreen(),
    const TrendingScreen(),
    // const TrendingScreen(),
  ];
  int selectedIndex = 0;

  void onTap(int index) {
    selectedIndex = index;
    emit(ScreenBottomNavState());
  }
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    emit(ZoomDrawerState());
  }









  String apiKey = '44fa3a1946ca56e8dd3645653f48df8f';

//Movie=أفلام
  Movie? movie;

  void getMovie(int id) {
    DioHelper.getData(
      url: '/3/movie/$id',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      movie = Movie.fromJson(value.data);
      print(topRated!.results![0].title);
      emit(GetMovieSuccessState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(GetMovieErrorState());
      },
    );
  }

  //get Top Rated=أعلى التقييمات احصل على أفضل الأفلام على موقع TMDB.
  TopRated? topRated;

  void getTopRated() {
    topRated = null;
    DioHelper.getData(
      url: '/3/movie/top_rated',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      topRated = TopRated.fromJson(value.data);
      emit(GetTopRatedSuccessState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(GetTopRatedErrorState());
      },
    );
  }

  //get popular=شعبي
  //احصل على قائمة بالأفلام الشعبية الحالية على TMDB. يتم تحديث هذه القائمة يوميًا.
  Popular? popular;

  void getPopular() {
    DioHelper.getData(
      url: '/3/movie/popular',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      popular = Popular.fromJson(value.data);
      print(popular!.results[0].title);
      emit(GetPopularSuccessState());
    }).catchError((error) {
      print('-----------------erorr popular----------------');
      print(error.toString());
      emit(GetPopularErrorState());
    });
  }

  //NowPlaying=الان العب
  now_playing? nowPlay;

  void getNowPlaying() {
    nowPlay = null;
    DioHelper.getData(
      url: '/3/movie/now_playing',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      nowPlay = now_playing.fromJson(value.data);
      emit(GetNowPlayingSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNowPlayingErrorState());
    });
  }

  //Latest=آخر
  //احصل على أحدث فيلم تم إنشاؤه. هذه استجابة حية وستتغير باستمرار.
  Latest? latest;

  void getLatest() {
    DioHelper.getData(
      url: '/3/movie/latest',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      latest = Latest.fromJson(value.data);
      //print(topRated!.results![0].title);
      emit(GetLatestSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetLatestErrorState());
    });
  }

  //upcoming=القادمة احصل على قائمة بالأفلام القادمة في دور العرض. هذا استعلام عن نوع الإصدار يبحث عن جميع الأفلام التي لها نوع إصدار 2 أو 3 خلال النطاق الزمني المحدد.
  Upcoming? upcoming;

  void getUpcoming() {
    DioHelper.getData(
      url: '/3/movie/upcoming',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      upcoming = Upcoming.fromJson(value.data);
      //print(topRated!.results![0].title);
      emit(GetUpcomingSuccessState());
    }).catchError((error) {
      print('-----------------------------------------');
      print(error.toString());
      emit(GetUpcomingErrorState());
    });
  }

  //Cast and Crew=احصل على الممثلين وطاقم العمل لفيلم.
  CastCrew? castCrew;

  void getCastCrew(int id) {
    emit(GetCastCrewLoadingState());
    DioHelper.getData(
      url: '/3/movie/$id/credits',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      castCrew = CastCrew.fromJson(value.data);
      emit(GetCastCrewSuccessState());
    }).catchError((error) {
      print('------------------------------------');
      print(error.toString());
      emit(GetCastCrewErrorState());
    });
  }

  //Get Belong Image Movie=احصل على الصور التي تنتمي إلى الفيلم.
  BelongImageMovie? belongImageMovie;

  void getBelongImageMovie(int id) {
    DioHelper.getData(
      url: '/3/movie/$id/images',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      belongImageMovie = BelongImageMovie.fromJson(value.data);
      //print(topRated!.results![0].title);
      emit(GetBelongImageMovieSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBelongImageMovieErrorState());
    });
  }

  //Get Recommended Movies=احصل على قائمة الأفلام الموصى بها لفيلم..
  RecommendedMovies? recommendedMovies;

  void getRecommendedMovies(int id) {
    emit(GetRecommendedMoviesLoadingState());
    DioHelper.getData(
      url: '/3/movie/$id/recommendations',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      recommendedMovies = RecommendedMovies.fromJson(value.data);
      //print(topRated!.results![0].title);
      emit(GetRecommendedMoviesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetRecommendedMoviesErrorState());
    });
  }

  //Get Similar Movies=احصل على قائمة بأفلام مماثلة. هذا ليس هو نفسه نظام "التوصيات"
  SimilarMovies? similarMovies;

  void getSimilarMovies(int id) {
    DioHelper.getData(
      url: '/3/movie/$id/similar',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      similarMovies = SimilarMovies.fromJson(value.data);
      //print(topRated!.results![0].title);
      emit(GetSimilarMoviesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSimilarMoviesErrorState());
    });
  }

  //Get Translations Movies=احصل على قائمة بالترجمات التي تم إنشاؤها لفيلم
  TranslationsMovies? translationsMovies;

  void getTranslationsMovies(int id) {
    DioHelper.getData(
      url: '/3/movie/$id/translations',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      translationsMovies = TranslationsMovies.fromJson(value.data);
      //print(topRated!.results![0].title);
      emit(GetTranslationsMoviesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTranslationsMoviesErrorState());
    });
  }

  //Get image Movie
  ImageMovie? imageMovie;

  void getImageMovie(int id) {
    DioHelper.getData(
      url: '/3/movie/$id/images',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      imageMovie = ImageMovie.fromJson(value.data);
      print('--------------------imageMovie----------------------------');

      //print(topRated!.results![0].title);
      emit(GetImageMovieSuccessState());
    }).catchError((error) {
      print('--------------------imageMovie ----------------------------');

      print(error.toString());
      emit(GetImageMovieErrorState());
    });
  }

  //Get Genre Movies
  GenreMovies? genreMovies;

  void getGenreMovies() {
    DioHelper.getData(
      url: '/3/genre/movie/list',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      genreMovies = GenreMovies.fromJson(value.data);
      //print(topRated!.results![0].title);
      emit(GetGenreMoviesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetGenreMoviesErrorState());
    });
  }

  //Get Genre Movies Details
  GenreMoviesDetails? genreMoviesDetails;

  void getGenreMoviesDetails(int id) {
    DioHelper.getData(
      url: '/3/discover/movie?with_genres=$id&',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      genreMoviesDetails = GenreMoviesDetails.fromJson(value.data);
      //print(topRated!.results![0].title);
      emit(GetGenreMoviesDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetGenreMoviesDetailsErrorState());
    });
  }

  //Get Trending Person
  TrendingPerson? trendingPerson;

  void getTrendingPerson() {
    DioHelper.getData(
      url: '/3/trending/person/week',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      trendingPerson = TrendingPerson.fromJson(value.data);
      print('--------------------trendingPerson----------------------------');

      emit(GetTrendingPersonSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTrendingPersonErrorState());
    });
  }

  //Get Trending Tv
  TrendingTv? trendingTv;

  void getTrendingTv() {
    DioHelper.getData(
      url: '/3/trending/tv/week',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      trendingTv = TrendingTv.fromJson(value.data);
      emit(GetTrendingTvSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTrendingTvErrorState());
    });
  }

  //Get Trending Movie
  TrendingMovie? trendingMovie;

  void getTrendingMovie() {
    DioHelper.getData(
      url: '/3/trending/movie/week',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      trendingMovie = TrendingMovie.fromJson(value.data);
      emit(GetTrendingMovieSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTrendingMovieErrorState());
    });
  }

  //Get Trending Movie
  YouTubeId? youTubeId;

  void getYouTubeId(int key) {
    DioHelper.getData(
      url: '/3/movie/$key/videos',
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      youTubeId = YouTubeId.fromJson(value.data);
      print('-------------------------------yutube');
      print(youTubeId!.results![0].key);
      emit(GetYouTubeIdSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetYouTubeIdErrorState());
    });
  }
}
