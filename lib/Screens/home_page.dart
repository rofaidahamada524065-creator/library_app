import 'package:flutter/material.dart';
import 'package:library_app/Provider/library_provider.dart';
import 'package:library_app/Screens/details.dart';
import 'package:library_app/Screens/search.dart';
import 'package:library_app/Widget/library_listtile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Search()),
            );
          },
        ),
        title: Text(
          "Books",
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
      ),
      body: Consumer<LibraryProvider>(
        builder: (context, value, child) {
          final data = value.libraryModel?.books;
          if (data == null) {
            value.LibraryBooks();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  LibraryListtile(book: data[index]),
            );
          }
        },
      ),
    );
  }
}
