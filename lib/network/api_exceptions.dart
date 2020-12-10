class ApiException implements Exception{
  final _message;
  final _prefix;

  ApiException(this._message, this._prefix);
  String toString(){
    return "$_prefix$_message";
  }
}
class FetchDataException extends ApiException{
  FetchDataException([String message])
      : super(message,"Bağlantı hatası");
}
class BadRequestException extends ApiException{
  BadRequestException([String message])
      : super(message,"Geçersiz istek");
}
class UnauthorisedException extends ApiException{
  UnauthorisedException([String message])
      : super(message,"Giriş yapılmamış");
}
class InvalidInputException extends ApiException{
  InvalidInputException([String message])
      : super(message,"Geçersiz girdi");
}
class AuthenticationException extends ApiException{
  AuthenticationException([String message])
      : super(message,"Hesap doğrulanamadı");
}
