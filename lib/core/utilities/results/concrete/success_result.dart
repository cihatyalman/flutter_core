import 'result.dart';

class SuccessResult extends Result{
  SuccessResult.withMessage(String message) : super.withMessage(true, message);
  SuccessResult() : super(true);
  
}