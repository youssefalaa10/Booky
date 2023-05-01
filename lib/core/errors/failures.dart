import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioErrorType.badCertificate:
        return ServerFailure('Connection timeout with ApiServer');

      case DioErrorType.badResponse:
        return ServerFailure.fromRespone(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioErrorType.unknown:
        return ServerFailure('Un expected Error, please try later!');

      case DioErrorType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Inernet Connection');
        }
        return ServerFailure('UnKnown Error, Please Try Again');
      default:
        return ServerFailure('Opps There was an Error, Please Try Again');
    }
  }

  factory ServerFailure.fromRespone(int statusCode, dynamic respone) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(respone['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('404, Your request not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
