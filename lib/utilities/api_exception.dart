class ApiException implements Exception{
  String title;
  String desc;
  ApiException({required this.title,required this.desc});
  String  toErrorMsg(){
    return "$title: $desc";
  }
}
class FetchDataException extends ApiException{
  FetchDataException({ required String errorMsg}): super(title: "Network exception", desc: errorMsg );
}
class UnauthorisedException extends ApiException{
  UnauthorisedException({ required String errorMsg}): super(title: "Network exception", desc: errorMsg );
}
class BadRequestException extends ApiException{
  BadRequestException({ required String errorMsg}): super(title: "Network exception", desc: errorMsg );
}
class InvalidInputEException extends ApiException{
  InvalidInputEException({ required String errorMsg}): super(title: "Network exception", desc: errorMsg );
}