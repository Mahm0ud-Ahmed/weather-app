import 'package:equatable/equatable.dart';

class APIError extends Equatable {
  String? message;
  int? code;

  APIError({this.message, this.code});

  @override
  List<Object?> get props => [code, message];

  @override
  bool get stringify => true;
}
