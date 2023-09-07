import 'package:flutter/material.dart';

class SearchedImagePage extends StatefulWidget {
  @override
  _SearchedImagePageState createState() => _SearchedImagePageState();
}

class _SearchedImagePageState extends State<SearchedImagePage> {
  String searchText = "";
  int pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 42,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              hintText: "Search Images",
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
