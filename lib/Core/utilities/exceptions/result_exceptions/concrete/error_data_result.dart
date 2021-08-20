import 'data_result.dart';

class ErrorDataResult<T> extends DataResult<T>{
  ErrorDataResult(T data) : super(data, false);
  ErrorDataResult.withMessage(T data, String message) : super.withMessage(data, false, message);
  
}