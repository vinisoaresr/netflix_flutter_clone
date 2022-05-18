class Items {
  int? id = 0;
  String? title = '';
  String? original_title = '';
  String? overview = '';
  String? poster_path = '';
  String? backdrop_path = '';

  Object? vote_average = 0.0;
  String? release_date = '';
  List<int?> genre_ids = [];
  bool? adult = true;

  Items.fromJson(json) {
    id = json['id'];
    title = json['title'];
    original_title = json['original_title'];
    overview = json['overview'];
    poster_path = json['poster_path'];
    backdrop_path = json['backdrop_path'];

    vote_average = json['vote_average'];
    release_date = json['release_date'];
    // genre_ids = json[''];
    adult = json['adult'];
  }
}
