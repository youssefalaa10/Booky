import 'package:bloc/bloc.dart';
import 'package:booky/Features/home/data/models/book_model/book_model.dart';
import 'package:booky/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'recommended_books_state.dart';

class RecommendedBooksCubit extends Cubit<RecommendedBooksState> {
  RecommendedBooksCubit(this.homeRepo) : super(RecommendedBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchRecommendedBooks({required String category}) async {
    emit(RecommendedBooksLoading());
    var result = await homeRepo.fetchRecommendedBooks(category: category);
    result.fold((failure) {
      emit(RecommendedBooksFailure(failure.errMessage));
    }, (books) {
      emit(RecommendedBooksSuccess(books));
    });
  }
}
