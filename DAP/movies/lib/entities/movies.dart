class Movie {
  final String title;
  final String director;
  final int year;
  final String poster;

  Movie({
    required this.title,
    required this.director,
    required this.year,
    required this.poster,
  });

  @override
  String toString() {
    return 'Movie(title: $title, director: $director, year: $year, poster: $poster)';
  }
}