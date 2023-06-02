# Movies App 🎬

![visitors](https://visitor-badge.glitch.me/badge?right_color=teal&page_id=vellt/Movies-App) 
![Web 1280 – 1]( https://img.shields.io/badge/made%20with-flutter-blue?style=flat)
[![License](https://img.shields.io/badge/license-MIT-orange)](./LICENSE)
![Web 1280 – 1]( https://img.shields.io/badge/-open%20source-wheat)

## Some Screens:

<table>
  <tr>
    <td><img src="https://github.com/moatasem-alhilali/Movie-App/blob/main/screenshots/1.jpg" alt="Image 2"></td>
    <td><img src="https://github.com/moatasem-alhilali/Movie-App/blob/main/screenshots/2.jpg" alt="Image 2"></td>
    <td><img src="https://github.com/moatasem-alhilali/Movie-App/blob/main/screenshots/3.jpg" alt="Image 2"></td>
  </tr>
</table>

<table>
  <tr>
    <td><img src="https://github.com/moatasem-alhilali/Movie-App/blob/main/screenshots/4.jpg" alt="Image 2"></td>
    <td><img src="https://github.com/moatasem-alhilali/Movie-App/blob/main/screenshots/5.jpg" alt="Image 2"></td>
    <td><img src="https://github.com/moatasem-alhilali/Movie-App/blob/main/screenshots/6.jpg" alt="Image 2"></td>
  </tr>
</table>




## Folder Structure
Here is the core folder structure which flutter provides.

```
flutter_bloc_boilerplate/
|- android
|- build
|- ios
|- lib
```
## Dependencies
- `flutter_bloc`: <a target="_blank" href="https://pub.dev/packages/flutter_bloc">https://pub.dev/packages/flutter_bloc</a>
- `path_provider`: <a target="_blank" href="https://pub.dev/packages/path_provider">https://pub.dev/packages/path_provider</a>
- `equatable`: <a target="_blank" href="https://pub.dev/packages/equatable">https://pub.dev/packages/equatable</a>
- `Fluttertoast`: <a target="_blank" href="https://pub.dev/packages/fluttertoast">https://pub.dev/packages/fluttertoast</a>
- `flutter_svg`: <a target="_blank" href="https://pub.dev/packages/flutter_svg">https://pub.dev/packages/flutter_svg</a>
- `shared preferences`: <a target="_blank" href="https://pub.dev/packages/shared_preferences">https://pub.dev/packages/shared_preferences</a>
- `html`: <a target="_blank" href="https://pub.dev/packages/html">https://pub.dev/packages/html</a>
- `sqflite`: <a target="_blank" href="https://pub.dev/packages/sqflite">https://pub.dev/packages/sqflite</a>
- `dio`: <a target="_blank" href="https://pub.dev/packages/dio">https://pub.dev/packages/dio</a>
- `lottie`: <a target="_blank" href="https://pub.dev/packages/lottie">https://pub.dev/packages/lottie</a>
- `readmore`: <a target="_blank" href="https://pub.dev/packages/readmore">https://pub.dev/packages/readmore</a>
- `translator`: <a target="_blank" href="https://pub.dev/packages/translator">https://pub.dev/packages/translator</a>
- `youtube_player_flutter`: <a target="_blank" href="https://pub.dev/packages/youtube_player_flutter">https://pub.dev/packages/youtube_player_flutter</a>
- `image_picker`: <a target="_blank" href="https://pub.dev/packages/image_picker">https://pub.dev/packages/image_picker</a>
- `url_launcher`: <a target="_blank" href="https://pub.dev/packages/url_launcher">https://pub.dev/packages/url_launcher</a>
- `video_player`: <a target="_blank" href="https://pub.dev/packages/video_player">https://pub.dev/packages/video_player</a>
- `connectivity_plus`: <a target="_blank" href="https://pub.dev/packages/connectivity_plus">https://pub.dev/packages/connectivity_plus</a>

## Getting Started
This application is using api of <a target="_blank" href="https://www.themoviedb.org/">themoviedb</a>, so before using it you have to create an api from <a  target="_blank" href="https://www.themoviedb.org/">themoviedb</a> and generate an API and apply it to this application, follow the below step to connect api with this app.

First go to <a target="_blank" href="https://www.themoviedb.org/documentation/api">https://www.themoviedb.org/documentation/api</a>, and follow the API Documentation, you will get the API Code.

- go to `secret/the_moviedb_api.dart`
- you will see the code like this

```dart
const String themoviedbApi = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
```
- replace the all `xx..` to your API, like this

```dart
const String themoviedbApi = 'your_api_code_here';
```
- enjoy coding 💙


## Before run project, execute commands:
- `flutter clean`
- `flutter pub get`
- `flutter pub run build_runner build` or `flutter pub run build_runner build --delete-conflicting-outputs`
- `flutter run` (if needed)

## Conclusion
I will be happy to answer any questions, please feel free to submit an issue and/or pull request 🙂

If you liked my project, don’t forget to ⭐ star the repo to show your support.
Thank you!!!
