import 'result.dart';

class ErrorResult extends Result{
  ErrorResult.withMessage(String message) : super.withMessage(false, message);
  ErrorResult() : super(false);

}