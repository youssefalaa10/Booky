import 'package:booky/Features/home/presentation/view_models/books_home_cubit/books_home_cubit.dart';
import 'package:booky/core/utils/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image_item.dart';

class BooksHomeListView extends StatelessWidget {
  const BooksHomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksHomeCubit, BooksHomeState>(
      builder: (context, state) {
        if (state is BooksHomeSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  );
                }),
          );
        } else if (state is BooksHomeFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
