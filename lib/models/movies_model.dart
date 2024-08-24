class MoviesModel {
  String title;
  String overview;
  String backdropPath;
  String posterPath;
  double voteAvarage;
  MoviesModel(
      {required this.title,
      required this.backdropPath,
      required this.overview,
      required this.posterPath,
      required this.voteAvarage});
  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
        title: json['title'],
        backdropPath:
            'https://image.tmdb.org/t/p/w500/${json['backdrop_path']}',
        overview: json['overview'],
        voteAvarage: json['vote_average'],
        posterPath: 'https://image.tmdb.org/t/p/w500/${json['poster_path']}');
  }
}
