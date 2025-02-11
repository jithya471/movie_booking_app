class MovieModel {
  final String title;
  final List<String> posterUrl;
  final String synopsis;

  final double rating;
  final String duration;

  MovieModel({
    required this.title,
    required this.posterUrl,
    required this.synopsis,
    required this.rating,
    required this.duration,
  });
}
