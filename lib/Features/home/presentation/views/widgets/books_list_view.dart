import 'package:flutter/material.dart';

import 'custom_book_image_item.dart';

class BooksHomeListView extends StatelessWidget {
  const BooksHomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomBookImage(),
            );
          }),
    );
  }
}