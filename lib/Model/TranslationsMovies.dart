class TranslationsMovies {
  int? id;
  List<Translations>? translations;

  TranslationsMovies({this.id, this.translations});

  TranslationsMovies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  String? iso31661;
  String? iso6391;
  String? name;
  String? englishName;
  Data? data;

  Translations(
      {this.iso31661, this.iso6391, this.name, this.englishName, this.data});

  Translations.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
    englishName = json['english_name'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso31661;
    data['iso_639_1'] = iso6391;
    data['name'] = name;
    data['english_name'] = englishName;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? homepage;
  String? overview;
  int? runtime;
  String? tagline;
  String? title;

  Data({this.homepage, this.overview, this.runtime, this.tagline, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    homepage = json['homepage'];
    overview = json['overview'];
    runtime = json['runtime'];
    tagline = json['tagline'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homepage'] = homepage;
    data['overview'] = overview;
    data['runtime'] = runtime;
    data['tagline'] = tagline;
    data['title'] = title;
    return data;
  }
}
