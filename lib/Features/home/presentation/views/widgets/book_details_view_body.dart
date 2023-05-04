import 'package:booky/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:booky/Features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'books_action.dart';
import 'books_details_list_view.dart';
import 'custom_books_deatails_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .2),
                    child: const CustomBookImage(
                      imageUrl:
                          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/contemporary-fiction-night-time-book-cover-design-template-1be47835c3058eb42211574e0c4ed8bf_screen.jpg?ts=1637012564',
                    ),
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                  Text(
                    'The Jungle Book',
                    style: Styles.textStyle30
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Opacity(
                    opacity: .7,
                    child: Text(
                      'Rudyard Kipling',
                      style: Styles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const BookRating(mainAxisAlignment: MainAxisAlignment.center),
                  const SizedBox(
                    height: 37,
                  ),
                  const BooksAction(),
                  const Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can also like',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const BooksDetailsListView(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
