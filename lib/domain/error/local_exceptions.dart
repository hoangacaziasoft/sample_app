class LocalExceptions implements Exception {}

class LocalEmptyException extends LocalExceptions{}

class AppExceptions implements Exception {}

class GenericException extends AppExceptions {
  GenericException() : super();
}
