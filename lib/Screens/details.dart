import 'package:flutter/material.dart';
import 'package:library_app/Models/library_model.dart';

class Details extends StatelessWidget {
  final Book books;
  new({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 400,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 232, 181, 198),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Container(
                width: 800,
                height: 100,
                padding: EdgeInsets.all(0.1),
                child: Image.network(
                  books.imageUrl,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image, size: 70),
                ),
              ),
              Text(
                books.title,
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: .bold,
                ),
              ),
              Text(
                books.author,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              Text("\$${books.price}", style: TextStyle(color: Colors.pink)),
              Text(
                books.description,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
