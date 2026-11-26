import 'package:flutter/material.dart';
import 'package:library_app/Models/library_model.dart';
import 'package:library_app/Screens/details.dart';

class LibraryListtile extends StatelessWidget {
  final Book book;
  new({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Details(books: book)),
          );
        },
        child: ListTile(
          leading: Image.network(
            book.imageUrl,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.broken_image, size: 50),
          ),
          title: Text(book.title, style: TextStyle(fontWeight: .bold)),
          subtitle: Text("\$${book.price}"),
          trailing: Row(
            mainAxisSize: .min,
            children: [
              Icon(Icons.star, color: Colors.amberAccent),
              Text("${book.rate}"),
            ],
          ),
        ),
      ),
    );
  }
}
