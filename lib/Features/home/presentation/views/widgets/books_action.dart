import 'package:booky/core/utils/functions/launcher_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/widgets/custom_preview_button.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomPreviewButton(
              onPressed: () async {
                Uri uri = Uri.parse(bookModel.accessInfo!.webReaderLink!);
                if (!await launchUrl(uri)) {
                  throw Exception('Could not launch $uri');
                }
              },
              backgroundColor: Colors.white,
              buttonText: 'free',
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomPreviewButton(
              onPressed: () {
                launchCustomUr(context, bookModel.volumeInfo.previewLink!);
                // if (await canLaunchUrl(uri)) {
                //   await launchUrl(uri);
                // }
              },
              backgroundColor: const Color(0xffEF8262),
              buttonText: getText(bookModel),
              textColor: Colors.white,
              fontSize: 16,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
