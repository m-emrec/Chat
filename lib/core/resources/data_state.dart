// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class DataState<T> {
  final T? data;
  final String? exception;
  DataState({
    this.data,
    this.exception,
  });
}

class DataSuccess extends DataState {
  DataSuccess(data) : super(data: data);
}

class DataFailed extends DataState {
  DataFailed(exception) : super(exception: exception);
}
