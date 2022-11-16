class Result<T> {
  T data;
  bool isSuccess;
  bool get hasError => !isSuccess;

  Result({required this.data, required this.isSuccess});
}
