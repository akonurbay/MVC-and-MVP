class ErrorHandler {
  // метод который принимает title и возвращает ошибку если title пустой
  static String? validate(String title) {
    if (title.isEmpty) {
      return 'Заголовок не может быть пустым';
    }
    return null;
  }
}
