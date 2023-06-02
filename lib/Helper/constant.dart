import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

String mainImage = 'https://image.tmdb.org/t/p/original';
String fakeImage = 'https://m.media-amazon.com/images/M/MV5BNjJkMzg3ZDUtM2E5Zi00YWMyLWFhOWUtZjI3M2Y4ZGEwOTYyXkEyXkFqcGdeQXVyMTMwMTcxNjk1._V1_.jpg';
Color primaryColor = const Color(0xFF292B37);
Color mainColor = const Color(0xFF0F111D);
TextStyle  get style{
  return TextStyle(
    fontFamily: 'muli',
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
// Widget imageLoading(
//     {String? url, double? height, double? width, double? errorHeight}) {
//   return CachedNetworkImage(
//     imageUrl: url!,
//     fit: BoxFit.cover,
//     height: height,
//     width: width,
//     errorWidget: (context, url, error) {
//       return Center(
//         child: Container(
//           width: width,
//           height: errorHeight ?? 150,
//           margin: const EdgeInsets.all(8),
//           child: Lottie.asset(
//             'assets/images/loading/loading3.json',
//           ),
//         ),
//       );
//     },
//     // placeholder: (context, url) {
//     //   return Center(
//     //     child: Container(
//     //       width: width,
//     //       height: 160,
//     //       margin: const EdgeInsets.all(8),
//     //       child: Lottie.asset(
//     //         'assets/images/loading/loading3.json',
//     //       ),
//     //     ),
//     //   );
//     // },
//   );
// }

Widget imageLoading(
    {String? url, double? height, double? width, double? errorHeight}) {
  return Image.network(
    url!,
    fit: BoxFit.cover,
    height: height,
    width: width,
    errorBuilder: (context, url, error) {
      return Center(
        child: Container(
          width: width,
          height: errorHeight ?? 130,
          margin: const EdgeInsets.all(8),
          child: Lottie.asset('assets/images/loading/wrong.json', height: 120),
        ),
      );
    },
    // frameBuilder: (context, child, x, bool s) {
    //   return Center(
    //     child: Container(
    //       width: width,
    //       height: 140,
    //       margin: const EdgeInsets.all(8),
    //       child: Lottie.asset(
    //         'assets/images/loading/loading3.json',
    //       ),
    //     ),
    //   );
    // },
  );
}

Future navigateTo({BuildContext? context, Widget? child}) {
  return Navigator.push(context!, MaterialPageRoute(builder: (_) => child!));
}
