class LibraryModel {
  final List<Book> books;

  new({required this.books});
  factory LibraryModel.fromjson(List json) {
    final templist = json
        .map<Book>(
          (e) => Book(
            id: e["id"],
            imageUrl: e["imageUrl"],
            price: e["price"],
            title: e["title"],
            author: e["author"],
            description: e["description"],
            rate: e["rate"],
          ),
        )
        .toList();
    return LibraryModel(books: templist);
  }
}

class Book {
  final int id;
  final String imageUrl;
  final num price;
  final String title;
  final String author;
  final String description;
  final num rate;

  new({
    required this.id,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.author,
    required this.description,
    required this.rate,
  });
}
