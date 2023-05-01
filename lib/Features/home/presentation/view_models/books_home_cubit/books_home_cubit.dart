import 'package:bloc/bloc.dart';
import 'package:booky/Features/home/data/models/book_model/book_model.dart';
import 'package:booky/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'books_home_state.dart';

class BooksHomeCubit extends Cubit<BooksHomeState> {
  BooksHomeCubit(this.homeRepo) : super(BooksHomeInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks() async {
    emit(BooksHomeLoading());

    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((failure) {
      emit(BooksHomeFailure(failure.errMessage));
    }, (books) {
      emit(BooksHomeSuccess(books));
    });
  }
}
