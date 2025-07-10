class Groceries {
  final String title;
  final String? photo;
  final String description;

  Groceries({
    required this.title,
    this.photo,
    required this.description,
  });

  @override
  String toString() {
    return 'Groceries{title: $title, photo: $photo, description: $description}';
  }
}
