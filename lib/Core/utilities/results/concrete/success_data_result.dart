import 'data_result.dart';

class SuccessDataResult<T> extends DataResult<T>{
  SuccessDataResult(T data) : super(data, true);
  SuccessDataResult.withMessage(T data, String message) : super.withMessage(data, true, message);
  
}