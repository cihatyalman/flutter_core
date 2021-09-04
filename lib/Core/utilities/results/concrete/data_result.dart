import '../abstract/i_data_result.dart';
import 'result.dart';

class DataResult<T> extends Result implements IDataResult<T>{
  T _data;

  @override
  T get data => this._data;

  DataResult(this._data,bool success) : super(success);
  DataResult.withMessage(this._data,bool success, String message) : super.withMessage(success, message);

}