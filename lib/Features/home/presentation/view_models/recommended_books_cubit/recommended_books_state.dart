part of 'recommended_books_cubit.dart';

abstract class RecommendedBooksState extends Equatable {
  const RecommendedBooksState();

  @override
  List<Object> get props => [];
}

class RecommendedBooksInitial extends RecommendedBooksState {}

class RecommendedBooksLoading extends RecommendedBooksState {}

class RecommendedBooksSuccess extends RecommendedBooksState {
  final List<BookModel> books;

  const RecommendedBooksSuccess(this.books);
}

class RecommendedBooksFailure extends RecommendedBooksState {
  final String errMessage;

  const RecommendedBooksFailure(this.errMessage);
}
