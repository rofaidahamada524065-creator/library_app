import 'package:flutter/material.dart';
import 'package:library_app/Provider/library_provider.dart';
import 'package:library_app/Widget/library_listtile.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  new({super.key});
  final TextEditingController controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final object = context.read<LibraryProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(
          "Search",
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .start,
        children: [
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              labelText: "Search....",

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            controller: controler,
            onChanged: (value) {
              if (value.trim().isNotEmpty) {
                object.Search(title: value);
              }
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: Consumer<LibraryProvider>(
              builder: (context, value, child) {
                final data = value.libraryModel?.books;
                if (data == null) {
                  return const Center();
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) =>
                        LibraryListtile(book: data[index]),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
