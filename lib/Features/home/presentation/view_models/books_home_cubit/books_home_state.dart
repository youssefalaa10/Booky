part of 'books_home_cubit.dart';

abstract class BooksHomeState extends Equatable {
  const BooksHomeState();

  @override
  List<Object> get props => [];
}

class BooksHomeInitial extends BooksHomeState {}

class BooksHomeLoading extends BooksHomeState {}

class BooksHomeSuccess extends BooksHomeState {
  final List<BookModel> books;

  const BooksHomeSuccess(this.books);
}

class BooksHomeFailure extends BooksHomeState {
  final String errMessage;

  const BooksHomeFailure(this.errMessage);
}
