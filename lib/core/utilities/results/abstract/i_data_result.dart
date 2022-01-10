import 'i_result.dart';

abstract class IDataResult<T> extends IResult{
  T? get data{}
}
